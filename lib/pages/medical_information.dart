import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import '../methods/database.dart';
import '../users/users_information.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Medical extends StatefulWidget {
  const Medical({super.key});

  @override
  State<Medical> createState() => _MedicalState();
}

class _MedicalState extends State<Medical> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool onlyread = true;
  bool enabledTextFormField = false;
  bool save = false;
  bool? check1 = false, check2 = false, check3 = false;
  late SharedPreferences prefs;

  TextEditingController _allergy = TextEditingController();
  TextEditingController _blood = TextEditingController();
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _medicine = TextEditingController();
  TextEditingController _congenital = TextEditingController();
  TextEditingController _takihgmedicine = TextEditingController();

  Map<String, dynamic> userData = {};

  void _getDataFromFirebase() async {
    final medical = await Databaseinformation()
        .getUserFromDB(auth.currentUser?.uid.toString());
    setState(() {
      userData = medical.data() as Map<String, dynamic>;
      _allergy.text = userData['allergy'];
      _blood.text = userData['blood'];
      _height.text = userData['height'];
      _weight.text = userData['weight'];
      _medicine.text = userData['medicine'];
      _congenital.text = userData['congenital'];
      _takihgmedicine.text = userData['takihgmedicine'];
    });
  }

  Future<void> initializePreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      check1 = prefs.getBool('check1') ?? false;
      check2 = prefs.getBool('check2') ?? false;
      check3 = prefs.getBool('check3') ?? false;
    });
  }

  Future<void> saveCheckbox() async {
    await prefs.setBool('check1', check1!);
    await prefs.setBool('check2', check2!);
    await prefs.setBool('check3', check3!);
  }

  void bloodcheck() {
    setState(() {
      if (_blood.text.isNotEmpty) {
        check1 = true;
      } else {
        check1 = false;
      }
    });
  }

  void weightcheck() {
    setState(() {
      if ([
        _weight.text,
      ].any((text) => text.isNotEmpty)) {
        check2 = true;
      } else {
        check2 = false;
      }
    });
  }

  void heightcheck() {
    setState(() {
      if ([
        _height.text,
      ].any((text) => text.isNotEmpty)) {
        check3 = true;
      } else {
        check3 = false;
      }
    });
  }

  void disDisabledable() {
    setState(() {
      onlyread = false;
      enabledTextFormField = true;
    });
  }

  void disDisabledable1() {
    setState(() {
      onlyread = true;
      enabledTextFormField = false;
    });
  }

  void buttonsave() {
    setState(() {
      save = true;
    });
  }

  void buttonsave1() {
    setState(() {
      save = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFromFirebase();
    initializePreferences();
  }

  void dispose() {
    saveCheckbox();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                customButton: const Icon(
                  Icons.more_vert,
                ),
                items: const [
                  DropdownMenuItem(
                    child: Text('แก้ไขข้อมูล'),
                    value: '1',
                  ),
                ],
                dropdownStyleData: DropdownStyleData(
                  width: 105,
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  elevation: 1,
                  offset: const Offset(0, 1),
                ),
                onChanged: (value) {
                  disDisabledable();
                  buttonsave();
                },
                isDense: true,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                    left: 0.0, top: 20.0, right: 0.0, bottom: 20.0),
                child: Center(
                  child: Text(
                    "ID ทางแพทย์",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: Color.fromARGB(255, 31, 29, 29),
                    ),
                  ),
                ),
              ),

              //name user
              Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color.fromARGB(255, 185, 185, 185),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 185, 185, 185),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, right: 0.0, bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${userData['name'] ?? ''}',
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          children: [
                            Text("${userData['age'] ?? ''} ปี"),
                            SizedBox(
                              width: 20,
                            ),
                            Text("วันเกิด ${userData['birthday'] ?? ''}"),
                          ],
                        )
                      ],
                    ),
                  )),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _allergy,
                      enabled: enabledTextFormField ? true : false,
                      readOnly: onlyread ? true : false,
                      decoration: InputDecoration(
                        hintText: '',
                        labelText: 'ภูมิแพ้และปฎิกิริยา',
                        labelStyle: TextStyle(color: Colors.red),
                        contentPadding: EdgeInsets.only(
                            left: 20, top: 10, right: 0, bottom: 10),
                      ),
                    ),
                  ],
                ),
              ),

              //กรุ๊ปเลือด น้ำหนัก ส่วนสูง
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Container(
                        height: 29,
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: Color.fromARGB(255, 185, 185, 185),
                            width: 1.0,
                          ),
                        )),
                        child: Row(
                          children: [
                            Checkbox(
                                value: check1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    check1 = value;
                                  });
                                },
                                checkColor: Colors.green,
                                activeColor: Colors.white,
                                side: MaterialStateBorderSide.resolveWith(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return const BorderSide(
                                          color: Colors.green);
                                    }
                                    return const BorderSide(
                                        color: Colors.green);
                                  },
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            const Text("กรุ๊ปเลือด"),
                          ],
                        )),
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Container(
                      width: 285,
                      decoration: const BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          color: Color.fromARGB(255, 185, 185, 185),
                          width: 1.0,
                        ),
                      )),
                      child: TextFormField(
                        controller: _blood,
                        readOnly: onlyread ? true : false,
                        enabled: enabledTextFormField ? true : false,
                        textCapitalization: TextCapitalization.characters,
                        decoration: const InputDecoration(
                          hintText: '',
                          isDense: true, // Added this
                          contentPadding: EdgeInsets.all(5),
                        ),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),

              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                        height: 29,
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: Color.fromARGB(255, 185, 185, 185),
                            width: 1.0,
                          ),
                        )),
                        child: Row(
                          children: [
                            Checkbox(
                                value: check2,
                                onChanged: (bool? value) {
                                  setState(() {
                                    check2 = value;
                                  });
                                },
                                checkColor: Colors.green,
                                activeColor: Colors.white,
                                side: MaterialStateBorderSide.resolveWith(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return const BorderSide(
                                          color: Colors.green);
                                    }
                                    return const BorderSide(
                                        color: Colors.green);
                                  },
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            const Text("น้ำหนัก"),
                          ],
                        )),
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Container(
                      width: 285,
                      decoration: const BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          color: Color.fromARGB(255, 185, 185, 185),
                          width: 1.0,
                        ),
                      )),
                      child: TextFormField(
                        controller: _weight,
                        readOnly: onlyread ? true : false,
                        enabled: enabledTextFormField ? true : false,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '',
                          isDense: true,
                          contentPadding: EdgeInsets.all(5),
                        ),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),

              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                        height: 29,
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: Color.fromARGB(255, 185, 185, 185),
                            width: 1.0,
                          ),
                        )),
                        child: Row(
                          children: [
                            Checkbox(
                                //only check box
                                value: check3, //unchecked
                                onChanged: (bool? value) {
                                  //value returned when checkbox is clicked
                                  setState(() {
                                    check3 = value;
                                  });
                                },
                                checkColor: Colors.green,
                                activeColor: Colors.white,
                                side: MaterialStateBorderSide.resolveWith(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return const BorderSide(
                                          color: Colors.green);
                                    }
                                    return const BorderSide(
                                        color: Colors.green);
                                  },
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            const Text("ส่วนสูง"),
                          ],
                        )),
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Container(
                      width: 285,
                      decoration: const BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          color: Color.fromARGB(255, 185, 185, 185),
                          width: 1.0,
                        ),
                      )),
                      child: TextFormField(
                        controller: _height,
                        readOnly: onlyread ? true : false,
                        enabled: enabledTextFormField ? true : false,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '',
                          isDense: true, // Added this
                          contentPadding: EdgeInsets.all(5),
                        ),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),

              TextFormField(
                controller: _medicine,
                readOnly: onlyread ? true : false,
                enabled: enabledTextFormField ? true : false,
                decoration: const InputDecoration(
                  hintText: '',
                  labelText: 'การให้ยา',
                  labelStyle: TextStyle(color: Colors.red),
                  contentPadding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                      right: 0,
                      bottom: 10), //  <- you can it to 0.0 for no space
                  isDense: false,
                ),
              ),

              TextFormField(
                controller: _congenital,
                readOnly: onlyread ? true : false,
                enabled: enabledTextFormField ? true : false,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.person),
                  hintText: '',
                  labelText: 'โรคประจำตัว',
                  labelStyle: TextStyle(color: Colors.red),
                  contentPadding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                      right: 0,
                      bottom: 10), //  <- you can it to 0.0 for no space
                  isDense: false,
                ),
              ),

              TextFormField(
                controller: _takihgmedicine,
                readOnly: onlyread ? true : false,
                enabled: enabledTextFormField ? true : false,
                decoration: const InputDecoration(
                  hintText: '',
                  labelText: 'ทานยา',
                  labelStyle: TextStyle(color: Colors.red),
                  contentPadding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                      right: 0,
                      bottom: 10), //  <- you can it to 0.0 for no space
                  isDense: false,
                ),
              ),

              Visibility(
                  visible: save,
                  child: IconButton(
                    onPressed: () {
                      updateUser();
                      bloodcheck;
                      weightcheck;
                      heightcheck();
                      buttonsave1();
                      disDisabledable1();
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.circlePlus,
                      size: 20,
                      color: Colors.green,
                    ),
                  ))
            ],
          ),
        )));
  }

  Future<void> updateUser() async {
    try {
      final collectionRef = FirebaseFirestore.instance.collection('users');
      final updatedatafirebase = <String, dynamic>{
        "blood": _blood.text,
        "weight": _weight.text,
        "height": _height.text,
        "allergy": _allergy.text,
        "congenital": _congenital.text,
        "medicine": _medicine.text,
        "takihgmedicine": _takihgmedicine.text,
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
