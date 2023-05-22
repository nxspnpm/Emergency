import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project1/methods/auth.dart';
import 'package:project1/pages/login_page.dart';
import 'package:project1/users/users_information.dart';

class Createaccount extends StatefulWidget {
  const Createaccount({super.key});

  @override
  State<Createaccount> createState() => _CreateaccountState();
}

class _CreateaccountState extends State<Createaccount> {
  final formKey = GlobalKey<FormState>();
  Usersinformation information = Usersinformation();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  // title: const Text('Account'),
                ),
                body: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 200,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                          // const SizedBox(
                          //   height: 5.0,
                          // ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),

                              //mail
                              TextFormField(
                                onSaved: (String? email) {
                                  information.email = email;
                                },
                                keyboardType: TextInputType.emailAddress,
                                validator: MultiValidator([
                                  EmailValidator(errorText: "Please enter a valid email address."),
                                  RequiredValidator(
                                      errorText: "Please enter E-mail"),
                                ]),
                                decoration: const InputDecoration(
                                  labelText: 'E-mail*',
                                  focusedBorder: OutlineInputBorder(
                                    // เมื่อ focus
                                    borderSide: BorderSide(width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    // สถานะปกติ
                                    borderSide: BorderSide(
                                        width: 0.0), // กำหนดสีในนี้ได้
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
                                onSaved: (String? password) {
                                  information.password = password;
                                },
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter Password";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Password*',
                                  focusedBorder: OutlineInputBorder(
                                    // เมื่อ focus
                                    borderSide: BorderSide(width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    // สถานะปกติ
                                    borderSide: BorderSide(
                                        width: 0.0), // กำหนดสีในนี้ได้
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
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: const Text('cancel',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    try {
                                      await Authent()
                                          .createUserWithEmailAndPassword(
                                        // email, password, value != null ? value : ""
                                        information.email.toString(),
                                        information.password.toString(),
                                      )
                                          .then((value) {
                                        formKey.currentState!.reset();
                                        Fluttertoast.showToast(
                                            msg: "Create Account success",
                                            gravity: ToastGravity.CENTER);
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Login();
                                        }));
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      print(e.code);
                                      String message;
                                      if (e.code == 'weak-password') {
                                        Fluttertoast.showToast(
                                            msg:
                                                "The password provided is too weak.", //อ่อนแอ
                                            gravity: ToastGravity.CENTER);
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        Fluttertoast.showToast(
                                            msg:
                                                "The account already exists for that email.",
                                            gravity: ToastGravity.CENTER);
                                      } else {
                                        message = e.message.toString();
                                      }
                                      // Fluttertoast.showToast(
                                      //     msg: message, //อ่อนแอ
                                      //     gravity: ToastGravity.CENTER);
                                    }
                                  }
                                },
                                child: const Text('Submit',
                                    style: TextStyle(color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
