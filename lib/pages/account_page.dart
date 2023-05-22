import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project1/component/bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1/users/users_information.dart';
import 'dart:developer';
import '../methods/database.dart';

// import 'package:project1/component/drawer_menu.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Map<String, dynamic> userData = {};
  TextEditingController _name = TextEditingController();
  TextEditingController _usersname = TextEditingController();
  TextEditingController _birthday = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phone = TextEditingController();
  

  void initState() {
    super.initState();
    _getDataFromFirebase();
  }

  void _getDataFromFirebase() async {
    final accountUser = await Databaseinformation()
        .getUserFromDB(auth.currentUser?.uid.toString());
    setState(() {
      userData = accountUser.data() as Map<String, dynamic>;
      _name.text = userData['name'];
      _usersname.text = userData['usersname'];
      _birthday.text = userData['birthday'];
      _age.text = userData['age'];
      _email.text = userData['email'];
      _password.text = userData['password'];
      _phone.text = userData['phone'];
    });
  }

  bool onlyread = true;
  bool enabledTextFormField = false;
  bool save = false;

  disDisabledable() {
    setState(() {
      onlyread = false;
      enabledTextFormField = true;
    });
  }

  disDisabledable1() {
    setState(() {
      onlyread = true;
      enabledTextFormField = false;
    });
  }

  buttonsave() {
    setState(() {
      save = true;
    });
  }

  buttonsave1() {
    setState(() {
      save = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade200,
        child: Stack(children: <Widget>[
          Container(
            color: Colors.grey,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
          ),

          Container(), // Required some widget in between to float AppBar

          Positioned(
            // To take AppBar Size onlyr
            top: 116.0,
            left: 30.0,
            right: 30.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 400.0,
                  height: 175.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/user.png',
                          ),
                          minRadius: 30,
                          maxRadius: 45,
                        ),
                        Text(
                          '${userData['name'] ?? ''}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        Text(
                          '${userData['usersname'] ?? ''}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10.0, color: Colors.grey),
                        ),
                      ]),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 13, 0, 5),
                      child: Container(
                        child: const Text(
                          "Profile",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    IconButton(
                        iconSize: 18,
                        color: Colors.grey.shade500,
                        focusColor: Colors.red,
                        onPressed: () {
                          disDisabledable();
                          buttonsave();
                        },
                        icon: Icon(Icons.border_color))
                  ],
                ),

                Container(
                  width: 400.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _name,
                        autofocus: true,
                        enabled: enabledTextFormField ? true : false,
                        readOnly: onlyread ? true : false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        ),
                      ),
                      TextFormField(
                        controller: _usersname,
                        enabled: enabledTextFormField ? true : false,
                        readOnly: onlyread ? true : false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.contacts),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        ),
                      ),
                      TextFormField(
                        controller: _birthday,
                        enabled: enabledTextFormField ? true : false,
                        readOnly: onlyread ? true : false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.cake),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        ),
                      ),
                      TextFormField(
                        controller: _age,
                        enabled: enabledTextFormField ? true : false,
                        readOnly: onlyread ? true : false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.cake_outlined),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        ),
                      ),
                    ],
                  ),
                ),

                //Account
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 13, 0, 8),
                      child: Container(
                        child: const Text(
                          "Account",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )
                  ],
                ),

                Container(
                  width: 400.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _email,
                        enabled: enabledTextFormField ? true : false,
                        readOnly: onlyread ? true : false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        ),
                      ),
                      TextFormField(
                        controller: _password,
                        enabled: enabledTextFormField ? true : false,
                        readOnly: onlyread ? true : false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        ),
                      ),
                      TextFormField(
                        controller: _phone,
                        enabled: enabledTextFormField ? true : false,
                        readOnly: onlyread ? true : false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone_iphone),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Visibility(
                    visible: save,
                    child: ElevatedButton(
                        onPressed: () {
                          updateUser();
                          buttonsave1();
                          disDisabledable1();
                        },
                        child: Text("SAVE",
                            style: TextStyle(color: Colors.white))))
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: const ButtomNavbar(
        number: 2,
      ),
    );
  }

  Future<void> updateUser() async {
    try {
      final collectionRef = FirebaseFirestore.instance.collection('users');
      final updatedatafirebase = <String, dynamic>{
        "name": _name.text,
        "usersname": _usersname.text,
        "birthday": _birthday.text,
        "age": _age.text,
        "email": _email.text,
        "password": _password.text,
        "phone": _phone.text,
      };
      await collectionRef
          .doc(auth.currentUser?.uid.toString())
          .update(updatedatafirebase);
      print('Document updated successfully!');
    } catch (e) {
      print('Error updating document: $e');
    }
  }
}
