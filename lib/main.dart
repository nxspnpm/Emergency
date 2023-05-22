import 'package:flutter/material.dart';
import 'package:project1/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project1/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get title => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        // canvasColor:const Color(0xffffffff)
      ),
      debugShowCheckedModeBanner: false,
      home: const Login(),
      // initialRoute: '/',
      // routes:  {
      //   '/':(context) => const HomePage(title: title)
      //   // '/product':(context) => const Product(),
      //   // '/about':(context) => const About(),
      // },
    );
  }
}
