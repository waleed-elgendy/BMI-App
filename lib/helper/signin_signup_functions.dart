import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> loginUser({required String email, required String pass}) async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: pass);
  var token = await FirebaseAuth.instance.currentUser!.getIdToken();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Future.wait([
    prefs.setString('token', token.toString()),
    prefs.setString('user', email)
  ]);
}

Future<void> registerUser({required String email, required String pass}) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: pass);
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  await users.doc(email).set({
    'email': email,
  });
}
