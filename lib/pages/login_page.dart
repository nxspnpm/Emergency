import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project1/pages/home_page.dart';
import 'package:project1/pages/sign_up.dart';
import '../users/users_information.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                title: const Text("error"),
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
                ),
                body: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 200,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Log in',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),

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
                                  // (String? value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Please enter E-mail";
                                  //   }
                                  //   return null;
                                  // },
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
                                  obscureText: true,
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
                                  height: 10.0,
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   height: 5.0,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Createaccount()),
                                    );
                                  },
                                  child: const Text("Forgot Password? "),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Createaccount()),
                                    );
                                  },
                                  child: const Text("Register"),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // ElevatedButton(
                                //   onPressed: () {
                                //     Navigator.pop(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 const Login()));
                                //   },
                                //   style: ElevatedButton.styleFrom(
                                //     backgroundColor: Colors.red,
                                //   ),
                                //   child: const Text('cancel',
                                //       style: TextStyle(color: Colors.white)),
                                // ),
                                SizedBox(
                                  width: 120,
                                  child: ElevatedButton(
                                    child: const Text('Submit',
                                        style: TextStyle(color: Colors.white)),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[700],
                                    ),
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();
                                        try {
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                                  email: information.email
                                                      .toString(),
                                                  password: information.password
                                                      .toString())
                                              .then((value) {
                                            formKey.currentState!.reset();
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return HomePage();
                                            }));
                                          });
                                        } on FirebaseAuthException catch (e) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  e.message.toString(), //อ่อนแอ
                                              gravity: ToastGravity.CENTER);
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )));
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
