import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project1/users/users_information.dart';

class Databaseinformation {
  Future addUserInfoToDB(String userId, Map<String, dynamic> Usersinformation) {
    // assert(Usersinformation != null);
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(Usersinformation);
  }

  Future<DocumentSnapshot> getUserFromDB(String? userId) async {
    return FirebaseFirestore.instance.collection("users").doc(userId).get();
  }
}
