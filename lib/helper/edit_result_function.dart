import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> editResult(
    {required BuildContext context,
      required String user,
      required double weight,
      required double height,
      required double age,
      required String id,
      required Timestamp createdAt}) async {
  var bmi = (weight / (height / 100 * height / 100));
  CollectionReference users =
  FirebaseFirestore.instance.collection("users/$user/results");
  users.doc(id).set({
    "age": age,
    "weight": weight,
    "height": height,
    "result": bmi < 18.5
        ? "Under Weight"
        : bmi < 24.9
        ? "Normal Weight"
        : bmi < 29.9
        ? "Over Weight"
        : bmi < 34.9
        ? "Obesity"
        : "Extreme Obesity",
    "id": id,
    "createdAt": createdAt
  });
  Navigator.pop(context);
}
