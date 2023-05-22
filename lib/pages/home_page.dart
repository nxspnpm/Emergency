import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1/component/drawer_menu.dart';
import 'package:project1/component/bottom_bar.dart';
import 'package:project1/pages/contactsnumber_page.dart';
import 'package:project1/pages/hotline_page.dart';
import 'package:project1/pages/medical_information.dart';
import 'package:project1/pages/report_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(height: 20), // add space of 20 logical pixels
            ),
            SliverToBoxAdapter(
              child: Text(
                'แจ้งเหตุฉุกเฉิน',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 40, 8, 45),
                child: ElevatedButton(
                  onPressed: () =>
                      AudioPlayer().play(AssetSource('audio/SOSsound.mp3')),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(170, 170),
                    backgroundColor: Colors.red,
                    shadowColor: Colors.red.shade800,
                    shape: const CircleBorder(),
                  ),
                  child: const Text(
                    'SOS',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 41),
              sliver: SliverGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 1,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Reportanemergency()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.red.shade800,
                          side: const BorderSide(color: Colors.red, width: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))
                          // Background color
                          ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            FaIcon(
                              FontAwesomeIcons.bell,
                              color: Colors.red,
                              size: 40,
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              'แจ้งเหตุฉุกเฉิน',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.red),
                            )
                          ])),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Contacts()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.red.shade800,
                          side: const BorderSide(color: Colors.red, width: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))
                          // Background color
                          ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            FaIcon(
                              FontAwesomeIcons.addressBook,
                              size: 35,
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              'รายชื่อติดต่อฉุกเฉิน',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.red),
                            )
                          ])),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Medical()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.red.shade800,
                          side: const BorderSide(color: Colors.red, width: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))
                          // Background color
                          ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            FaIcon(
                              FontAwesomeIcons.hospitalUser,
                              color: Colors.red,
                              size: 35,
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              'ID ทางแพทย์',
                              style: TextStyle(color: Colors.red),
                            )
                          ])),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Hotline()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.red.shade800,
                          side: const BorderSide(color: Colors.red, width: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))
                          // Background color
                          ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            FaIcon(
                              FontAwesomeIcons.phone,
                              color: Colors.red,
                              size: 35,
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              'สายด่วน',
                              style: TextStyle(color: Colors.red),
                            )
                          ])),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const ButtomNavbar(
        number: 0,
      ),
    );
  }
}
