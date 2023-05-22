import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../methods/database.dart';
import 'contactsnumber_page.dart';

class ContactsEdit extends StatefulWidget {
  const ContactsEdit({super.key});

  @override
  State<ContactsEdit> createState() => _ContactsEditState();
}

class _ContactsEditState extends State<ContactsEdit> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void initState() {
    super.initState();
    _getDataFromFirebase();
  }

  void _getDataFromFirebase() async {
    final test = await Databaseinformation()
        .getUserFromDB(auth.currentUser?.uid.toString());
    setState(() {
      userData = test.data() as Map<String, dynamic>;
      _contactName1.text = userData['contactName1'];
      _contactPhone1.text = userData['contactPhone1'];
      _contactName2.text = userData['contactName2'];
      _contactPhone2.text = userData['contactPhone2'];
      _contactName3.text = userData['contactName3'];
      _contactPhone3.text = userData['contactPhone3'];
      _contactName4.text = userData['contactName4'];
      _contactPhone4.text = userData['contactPhone4'];
      _contactName5.text = userData['contactName5'];
      _contactPhone5.text = userData['contactPhone5'];
      _contactName6.text = userData['contactName6'];
      _contactPhone6.text = userData['contactPhone6'];
      _contactName7.text = userData['contactName7'];
      _contactPhone7.text = userData['contactPhone7'];
    });
  }

  TextEditingController _contactName1 = TextEditingController();
  TextEditingController _contactPhone1 = TextEditingController();
  TextEditingController _contactName2 = TextEditingController();
  TextEditingController _contactPhone2 = TextEditingController();
  TextEditingController _contactName3 = TextEditingController();
  TextEditingController _contactPhone3 = TextEditingController();
  TextEditingController _contactName4 = TextEditingController();
  TextEditingController _contactPhone4 = TextEditingController();
  TextEditingController _contactName5 = TextEditingController();
  TextEditingController _contactPhone5 = TextEditingController();
  TextEditingController _contactName6 = TextEditingController();
  TextEditingController _contactPhone6 = TextEditingController();
  TextEditingController _contactName7 = TextEditingController();
  TextEditingController _contactPhone7 = TextEditingController();

  Map<String, dynamic> userData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'เพิ่มรายชื่อติดต่อฉุกเฉิน',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 400.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        Text(
                          'Contact 1',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: _contactName1,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            contentPadding:
                                EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),

                            focusedBorder: OutlineInputBorder(
                              // เมื่อ focus
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // สถานะปกติ
                              borderSide:
                                  BorderSide(width: 0.0), // กำหนดสีในนี้ได้
                            ),
                            // error ขอบ
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                            //เมื่อ focus
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: _contactPhone1,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            contentPadding:
                                EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),

                            focusedBorder: OutlineInputBorder(
                              // เมื่อ focus
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // สถานะปกติ
                              borderSide:
                                  BorderSide(width: 0.0), // กำหนดสีในนี้ได้
                            ),
                            // error ขอบ
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                            //เมื่อ focus
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          'Contact 2',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: _contactName2,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            contentPadding:
                                EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),

                            focusedBorder: OutlineInputBorder(
                              // เมื่อ focus
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // สถานะปกติ
                              borderSide:
                                  BorderSide(width: 0.0), // กำหนดสีในนี้ได้
                            ),
                            // error ขอบ
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                            //เมื่อ focus
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: _contactPhone2,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            contentPadding:
                                EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),

                            focusedBorder: OutlineInputBorder(
                              // เมื่อ focus
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // สถานะปกติ
                              borderSide:
                                  BorderSide(width: 0.0), // กำหนดสีในนี้ได้
                            ),
                            // error ขอบ
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                            //เมื่อ focus
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          'Contact 3',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: _contactName3,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            contentPadding:
                                EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),

                            focusedBorder: OutlineInputBorder(
                              // เมื่อ focus
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // สถานะปกติ
                              borderSide:
                                  BorderSide(width: 0.0), // กำหนดสีในนี้ได้
                            ),
                            // error ขอบ
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                            //เมื่อ focus
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: _contactPhone3,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            contentPadding:
                                EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),

                            focusedBorder: OutlineInputBorder(
                              // เมื่อ focus
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // สถานะปกติ
                              borderSide:
                                  BorderSide(width: 0.0), // กำหนดสีในนี้ได้
                            ),
                            // error ขอบ
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                            //เมื่อ focus
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          'Contact 4',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: _contactName4,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            contentPadding:
                                EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),

                            focusedBorder: OutlineInputBorder(
                              // เมื่อ focus
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // สถานะปกติ
                              borderSide:
                                  BorderSide(width: 0.0), // กำหนดสีในนี้ได้
                            ),
                            // error ขอบ
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                            //เมื่อ focus
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: _contactPhone4,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            contentPadding:
                                EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),

                            focusedBorder: OutlineInputBorder(
                              // เมื่อ focus
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // สถานะปกติ
                              borderSide:
                                  BorderSide(width: 0.0), // กำหนดสีในนี้ได้
                            ),
                            // error ขอบ
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                            //เมื่อ focus
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          'Contact 5',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: _contactName5,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            contentPadding:
                                EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),

                            focusedBorder: OutlineInputBorder(
                              // เมื่อ focus
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // สถานะปกติ
                              borderSide:
                                  BorderSide(width: 0.0), // กำหนดสีในนี้ได้
                            ),
                            // error ขอบ
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                            //เมื่อ focus
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: _contactPhone5,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            contentPadding:
                                EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),

                            focusedBorder: OutlineInputBorder(
                              // เมื่อ focus
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // สถานะปกติ
                              borderSide:
                                  BorderSide(width: 0.0), // กำหนดสีในนี้ได้
                            ),
                            // error ขอบ
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                            //เมื่อ focus
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          'Contact 6',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: _contactName6,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            contentPadding:
                                EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),

                            focusedBorder: OutlineInputBorder(
                              // เมื่อ focus
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // สถานะปกติ
                              borderSide:
                                  BorderSide(width: 0.0), // กำหนดสีในนี้ได้
                            ),
                            // error ขอบ
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                            //เมื่อ focus
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: _contactPhone6,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            contentPadding:
                                EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),

                            focusedBorder: OutlineInputBorder(
                              // เมื่อ focus
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // สถานะปกติ
                              borderSide:
                                  BorderSide(width: 0.0), // กำหนดสีในนี้ได้
                            ),
                            // error ขอบ
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                            //เมื่อ focus
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          'Contact 7',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: _contactName7,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            contentPadding:
                                EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),

                            focusedBorder: OutlineInputBorder(
                              // เมื่อ focus
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // สถานะปกติ
                              borderSide:
                                  BorderSide(width: 0.0), // กำหนดสีในนี้ได้
                            ),
                            // error ขอบ
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                            //เมื่อ focus
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: _contactPhone7,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            contentPadding:
                                EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),

                            focusedBorder: OutlineInputBorder(
                              // เมื่อ focus
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // สถานะปกติ
                              borderSide:
                                  BorderSide(width: 0.0), // กำหนดสีในนี้ได้
                            ),
                            // error ขอบ
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                            //เมื่อ focus
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.red), // กำหนดสีในนี้ได้
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ContactsEdit()),
                          );
                        },
                        child: Text('CANCEL',
                                    style: TextStyle(color: Colors.white)),
                                    style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context,
                              MaterialPageRoute(builder: (context) {
                            return Contacts();
                          }));
                          updateContactsEdit();
                        },
                        child: Text(' SAVE ',style: TextStyle(color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[700],
                                ))
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateContactsEdit() async {
    try {
      final collectionRef = FirebaseFirestore.instance.collection('users');
      final updatedatafirebase = <String, dynamic>{
        "contactName1": _contactName1.text,
        "contactPhone1": _contactPhone1.text,
        "contactName2": _contactName2.text,
        "contactPhone2": _contactPhone2.text,
        "contactName3": _contactName3.text,
        "contactPhone3": _contactPhone3.text,
        "contactName4": _contactName4.text,
        "contactPhone4": _contactPhone4.text,
        "contactName5": _contactName5.text,
        "contactPhone5": _contactPhone5.text,
        "contactName6": _contactName6.text,
        "contactPhone6": _contactPhone6.text,
        "contactName7": _contactName7.text,
        "contactPhone7": _contactPhone7.text,
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
