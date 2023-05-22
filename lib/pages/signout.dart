import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class signout extends StatefulWidget {
  const signout({super.key});

  @override
  State<signout> createState() => _signoutState();
}

class _signoutState extends State<signout> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text("Log out"),
        onPressed: () {
          auth.signOut().then((value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return Login();
            }));
          });
        });
  }
}
