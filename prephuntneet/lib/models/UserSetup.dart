import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DatabaseManager {
  CollectionReference users = FirebaseFirestore.instance.collection(
      'UserData');

  Future<void> userSetup(String Email, String PhoneNumber, String UserName,
      String DisplayName,String uid) async {

    return await users.doc(uid).set({
      "Email ":Email,
      "Phone number":PhoneNumber,
      "UserName":UserName,
      "Display name ":DisplayName,
    });
  }
}