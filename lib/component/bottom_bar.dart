import 'package:flutter/material.dart';
import 'package:project1/pages/account_page.dart';
import 'package:project1/pages/home_page.dart';
import 'package:project1/pages/map_page.dart';

class ButtomNavbar extends StatefulWidget {
  final int number;

  const ButtomNavbar({Key? key, required this.number}) : super(key: key);
  @override
  State<ButtomNavbar> createState() => _ButtomNavbarState();
}

class _ButtomNavbarState extends State<ButtomNavbar> {
  @override
  Widget build(BuildContext context) {
    // var route = ModalRoute.of(context);
    // if (route != null) {
    //   print(route.settings.name);
    // }
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey,
      // backgroundColor: Colors.grey.shade700,
      // backgroundColor: const Color(0xff30475e),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
      ],
      currentIndex: widget.number,
      selectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(fontSize: 13),
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
            break;
          case 1:
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Mappage(something: '')));
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Account()),
            );
            break;
        }
      },
    );
  }
}
