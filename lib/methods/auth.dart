import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project1/methods/database.dart';
import 'package:project1/users/users_information.dart';

class Authent {
  final FirebaseAuth auth = FirebaseAuth.instance;  
  Usersinformation information = Usersinformation();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  Future<User> getCurrentUser() async {
    return await auth.currentUser!;
  }

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    
  ) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    Map<String, dynamic> Usersinformation = {
      "email": email.toString(),
      "password": password.toString(),
    };

    if (userCredential != null) {
      Databaseinformation()
          .addUserInfoToDB(auth.currentUser!.uid, Usersinformation);
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email.toString(), password: password.toString());
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  //   Future<void> delete() async {
  //       await auth.currentUser?.delete();

  // }
}
