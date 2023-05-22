import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/methods/database.dart';
import 'package:project1/pages/about_page.dart';
import 'package:project1/pages/account_page.dart';
import 'package:project1/pages/home_page.dart';
import 'package:project1/pages/login_page.dart';
import 'package:project1/pages/sign_up.dart';
import 'package:flutter/cupertino.dart';

import '../pages/api_page.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final auth = FirebaseAuth.instance;
  // final FirebaseAuth auth = FirebaseAuth.instance;
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

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context);
    if (route != null) {
      print(route.settings.name);
    }
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
              // color: Color(0xff30475e),
            ),
            accountName: Text('${userData['name'] ?? ''}'),
            accountEmail: Text('${userData['email'] ?? ''}'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('home'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            // selected: ModalRoute.of(context)?.settings.name == '/' ? true :false,
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Account'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Account()),
              );
            },
            selected: ModalRoute.of(context)?.settings.name == '/about'
                ? true
                : false,
          ),
          ListTile(
            leading: const Icon(Icons.houseboat_rounded),
            title: const Text('api'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const api()),
              );
            },
            selected: ModalRoute.of(context)?.settings.name == '/about'
                ? true
                : false,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('delete'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              deleteAccount(context);
            },
            selected: ModalRoute.of(context)?.settings.name == '/login'
                ? true
                : false,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              _logout(context);
            },
            selected:
                ModalRoute.of(context)?.settings.name == '' ? true : false,
          )
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text('Logout'),
        content: Text('Do you want to logout?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              });
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  void deleteAccount(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text('Delete Account'),
        content: Text('Do you want to Delete My Account?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              deleteUser();
              auth.currentUser?.delete().then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              });
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  Future<void> deleteUser() async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    return users
        .doc(auth.currentUser?.uid.toString())
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
