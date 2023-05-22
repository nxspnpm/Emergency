import 'package:flutter/material.dart';
import 'package:project1/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const HomePage());

class Hotline extends StatefulWidget {
  const Hotline({super.key});

  @override
  State<Hotline> createState() => _HotlineState();
}

//ศูนย์การแพทย์ฉุกเฉินแห่งชาติ
callphoneemergencymedicalfoundationofthailand() async {
  final Uri telLaunchUri =
      Uri(scheme: 'tel', path: '1669', queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  });
  if (await canLaunchUrl(telLaunchUri)) {
    launchUrl(telLaunchUri);
  } else {
    throw 'Could not launch';
  }
}

//กองบังคับการสายตรวจ
callphoneroyalthaipolice() async {
  final Uri telLaunchUri =
      Uri(scheme: 'tel', path: '191', queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  });
  if (await canLaunchUrl(telLaunchUri)) {
    launchUrl(telLaunchUri);
  } else {
    throw 'Could not launch';
  }
}

//สถานีดับเพลิง
callphonefirestation() async {
  final Uri telLaunchUri =
      Uri(scheme: 'tel', path: '199', queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  });
  if (await canLaunchUrl(telLaunchUri)) {
    launchUrl(telLaunchUri);
  } else {
    throw 'Could not launch';
  }
}

// กรมควบคุมโรค
callphonedepartmentofdiseasecontrol() async {
  final Uri telLaunchUri =
      Uri(scheme: 'tel', path: '1422', queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  });
  if (await canLaunchUrl(telLaunchUri)) {
    launchUrl(telLaunchUri);
  } else {
    throw 'Could not launch';
  }
}

// สายด่วนโควิด
callphonecovidhotline() async {
  final Uri telLaunchUri =
      Uri(scheme: 'tel', path: '1668', queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  });
  if (await canLaunchUrl(telLaunchUri)) {
    launchUrl(telLaunchUri);
  } else {
    throw 'Could not launch';
  }
}

// สำนักงานประกันสังคม
callphonesocialsecurityoffice() async {
  final Uri telLaunchUri =
      Uri(scheme: 'tel', path: '1506', queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  });
  if (await canLaunchUrl(telLaunchUri)) {
    launchUrl(telLaunchUri);
  } else {
    throw 'Could not launch';
  }
}

// สายด่วนจราจร
callphonetrafficpolice() async {
  final Uri telLaunchUri =
      Uri(scheme: 'tel', path: '1197', queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  });
  if (await canLaunchUrl(telLaunchUri)) {
    launchUrl(telLaunchUri);
  } else {
    throw 'Could not launch';
  }
}

class _HotlineState extends State<Hotline> {
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
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'สายด่วนฉุกเฉิน',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //       left: 0, top: 10.0, right: 0.0, bottom: 20.0),
          //   child: TextField(
          //     style: TextStyle(color: Colors.black),
          //     decoration: InputDecoration(
          //       filled: true,
          //       fillColor: Colors.grey.shade200,
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(8),
          //         borderSide: BorderSide.none,
          //       ),
          //       hintText: "Search",
          //       prefixIcon: Icon(Icons.search),
          //       prefixIconColor: Colors.black,
          //     ),
          //   ),
          // ),

          SizedBox(
            height: 30,
          ),
//listview
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  onTap: () async {
                    callphoneemergencymedicalfoundationofthailand();
                  },
                  tileColor: Colors.grey.shade300,
                  title: const Text(
                    '1669',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'ศูนย์การแพทย์ฉุกเฉินแห่งชาติ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 31, 29, 29),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () async {
                    callphoneroyalthaipolice();
                  },
                  tileColor: Colors.white,
                  title: const Text(
                    '191',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'กองบังคับการสายตรวจ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 31, 29, 29),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () async {
                    callphonefirestation();
                  },
                  tileColor: Colors.grey.shade300,
                  title: const Text(
                    '199',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'เหตุไฟไหม้ ดับเพลิง',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 31, 29, 29),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () async {
                    callphonedepartmentofdiseasecontrol();
                  },
                  tileColor: Colors.white,
                  title: const Text(
                    '1422',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'กรมควบคุมโรค',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 31, 29, 29),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () async {
                    callphonecovidhotline();
                  },
                  tileColor: Colors.grey.shade300,
                  title: const Text(
                    '1668',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'สายด่วนโควิด',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 31, 29, 29),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () async {
                    callphonesocialsecurityoffice();
                  },
                  tileColor: Colors.white,
                  title: const Text(
                    '1506',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'สำนักงานประกันสังคม',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 31, 29, 29),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () async {
                    callphonetrafficpolice();
                  },
                  tileColor: Colors.grey.shade300,
                  title: const Text(
                    '1197',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'สายด่วนการจราจร',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 31, 29, 29),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

// //       // bottomNavigationBar: const ButtomNavbar(
// //       //   number: 2,
// //       // ),
    // );
    // }
  }
}
