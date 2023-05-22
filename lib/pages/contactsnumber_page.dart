import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../methods/database.dart';
import 'contactsnumberEdie_page.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Map<String, dynamic> userData = {};

    void initState() {
    super.initState();
    _getDataFromFirebase();
  }

  void _getDataFromFirebase() async {
    final test = await Databaseinformation()
        .getUserFromDB(auth.currentUser?.uid.toString());
    setState(() {
      userData = test.data() as Map<String, dynamic>;
    });
  }
  contacts1() async {
  final Uri telLaunchUri =
      Uri(scheme: 'tel', path: '${userData['contactPhone1'] ?? ''}', queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  });
  if (await canLaunchUrl(telLaunchUri)) {
    launchUrl(telLaunchUri);
  } else {
    throw 'Could not launch';
  }
}

contacts2() async {
  final Uri telLaunchUri =
      Uri(scheme: 'tel', path: '${userData['contactPhone2'] ?? ''}', queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  });
  if (await canLaunchUrl(telLaunchUri)) {
    launchUrl(telLaunchUri);
  } else {
    throw 'Could not launch';
  }
}

contacts3() async {
  final Uri telLaunchUri =
      Uri(scheme: 'tel', path: '${userData['contactPhone3'] ?? ''}', queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  });
  if (await canLaunchUrl(telLaunchUri)) {
    launchUrl(telLaunchUri);
  } else {
    throw 'Could not launch';
  }
}

contacts4() async {
  final Uri telLaunchUri =
      Uri(scheme: 'tel', path: '${userData['contactPhone4'] ?? ''}', queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  });
  if (await canLaunchUrl(telLaunchUri)) {
    launchUrl(telLaunchUri);
  } else {
    throw 'Could not launch';
  }
}

contacts5() async {
  final Uri telLaunchUri =
      Uri(scheme: 'tel', path: '${userData['contactPhone5'] ?? ''}', queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  });
  if (await canLaunchUrl(telLaunchUri)) {
    launchUrl(telLaunchUri);
  } else {
    throw 'Could not launch';
  }
}

contacts6() async {
  final Uri telLaunchUri =
      Uri(scheme: 'tel', path: '${userData['contactPhone6'] ?? ''}', queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  });
  if (await canLaunchUrl(telLaunchUri)) {
    launchUrl(telLaunchUri);
  } else {
    throw 'Could not launch';
  }
}

contacts7() async {
  final Uri smsLaunchUri =
      Uri(scheme: 'sms', path: '${userData['contactPhone7'] ?? ''}', queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  });
  if (await canLaunchUrl(smsLaunchUri)) {
    launchUrl(smsLaunchUri);
  } else {
    throw 'Could not launch';
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // backgroundColor: Colors.grey,
            // backgroundColor: const Color(0xff30475e),
            // title: Text(widget.title),
            ),

        //search
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
                  'เพิ่มรายชื่อติดต่อฉุกเฉิน',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                            SizedBox(
              height: 30,
            ),
            //listview
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {
                      contacts1();
                    },
                    tileColor: Colors.grey.shade300,
                    title:  Text(
                      '${userData['contactName1'] ?? ''}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 31, 29, 29),
                      ),
                    ),
                    subtitle:  Text(
                      '${userData['contactPhone1'] ?? ''}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      contacts2();
                    },
                    tileColor: Colors.white,
                    title:  Text(
                      '${userData['contactName2'] ?? ''}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 31, 29, 29),
                      ),
                    ),
                    subtitle:  Text(
                      '${userData['contactPhone2'] ?? ''}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      contacts3();
                    },
                    tileColor: Colors.grey.shade300,
                    title:  Text(
                      '${userData['contactName3'] ?? ''}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 31, 29, 29),
                      ),
                    ),
                    subtitle:  Text(
                      '${userData['contactPhone3'] ?? ''}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      contacts4();
                    },
                    tileColor: Colors.white,
                    title:  Text(
                      '${userData['contactName4'] ?? ''}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 31, 29, 29),
                      ),
                    ),
                    subtitle:  Text(
                      '${userData['contactPhone4'] ?? ''}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      contacts5();
                    },
                    tileColor: Colors.grey.shade300,
                    title:  Text(
                      '${userData['contactName5'] ?? ''}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 31, 29, 29),
                      ),
                    ),
                    subtitle:  Text(
                      '${userData['contactPhone5'] ?? ''}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      contacts6();
                    },
                    tileColor: Colors.white,
                    title:  Text(
                      '${userData['contactName6'] ?? ''}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 31, 29, 29),
                      ),
                    ),
                    subtitle:  Text(
                      '${userData['contactPhone6'] ?? ''}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      contacts7();
                    },
                    tileColor: Colors.grey.shade300,
                    title:  Text(
                      '${userData['contactName7'] ?? ''}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 31, 29, 29),
                      ),
                    ),
                    subtitle:  Text(
                      '${userData['contactPhone7'] ?? ''}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactsEdit()),
                      );
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.circlePlus,
                      size: 20,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          ],
        )
        // bottomNavigationBar: const ButtomNavbar(
        //   number: 2,
        // ),
        );
  }
}
