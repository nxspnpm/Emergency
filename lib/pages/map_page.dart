import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../methods/database.dart';

class Mappage extends StatefulWidget {
  final String something;

  Mappage({required this.something, Key? key}) : super(key: key);

  @override
  _MappageState createState() => _MappageState();
}

List<String> recipents = ["0917925431"];

class _MappageState extends State<Mappage> {
  late Position userLocation;
  late GoogleMapController mapController;
  Uri _url = Uri.parse('');
  final FirebaseAuth auth = FirebaseAuth.instance;
  Map<String, dynamic> userData = {};

    void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
    _getDataFromFirebase();
  }

  void _getDataFromFirebase() async {
    final test = await Databaseinformation()
        .getUserFromDB(auth.currentUser?.uid.toString());
    setState(() {
      userData = test.data() as Map<String, dynamic>;
    });
  }

  // policecontact(urllocation) async {
  //   final Uri smsLaunchUri = Uri(
  //       scheme: 'sms',
  //       path: '+66957497452',
  //       queryParameters: <String, String>{
  //         'body': Uri.encodeComponent('${widget.something} + ${urllocation}'),
  //       });
  //   print(widget.something);
  //   print(urllocation);
  //   if (await canLaunchUrl(smsLaunchUri)) {
  //     launchUrl(smsLaunchUri);
  //   } else {
  //     throw 'Could not launch';
  //   }
  // }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<Position> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    userLocation = await Geolocator.getCurrentPosition();
    return userLocation;
  }

  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(14.0385634, 100.7362004),
        infoWindow: InfoWindow(title: 'ป้อมตำรวจชุมชนพรธิสาร (0613311036)')),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(14.0209762, 100.7315202),
        infoWindow: InfoWindow(title: 'สถานีตำรวจธัญบุรี (0973598935)')),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(14.0708066, 100.7063755),
        infoWindow: InfoWindow(title: 'สถานีตำรวจภูธรคลองห้า (0812077000)')),
  ];

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Location'),
      ),
      body: FutureBuilder(
        future: _getLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
              mapType: MapType.normal,
              markers: Set<Marker>.of(_marker),
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(userLocation.latitude, userLocation.longitude),
                  zoom: 15),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              _url = Uri.parse(
                  'https://www.google.com/maps?q=${userLocation.latitude},${userLocation.longitude}');
              mapController.animateCamera(CameraUpdate.newLatLngZoom(
                  LatLng(userLocation.latitude, userLocation.longitude), 18));
              // policecontact(_url);
              _policecontact(
                  '${userData['name'] ?? ''} แจ้งเหตุ ${widget.something} ${_url} ',
                  recipents);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(
                      'Your sent sms',
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              );
            },
            label: Text("Send Location"),
            icon: Icon(Icons.near_me),
          ),
        ],
      ),
    );
  }

  void _policecontact(String message, List<String> recipients) async {
    String _result = await sendSMS(message: message, recipients: recipients)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
}
