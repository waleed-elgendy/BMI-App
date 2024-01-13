import 'package:bmi_app/pages/bmi_calculator_page.dart';
import 'package:bmi_app/shared/result_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> storeResult(
  BuildContext context,
  String user,
) async {
  bmi = (weight / (height / 100 * height / 100));
  CollectionReference users =
      FirebaseFirestore.instance.collection("users/$user/results");
  users.doc(DateTime.now().toString().substring(0, 19)).set({
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
    "id": DateTime.now().toString().substring(0, 19),
    "createdAt": DateTime.now()
  });
  controller1.clear();
  controller2.clear();
  controller3.clear();
  showDialog(
    context: context,
    builder: (context) {
      return ResultCard(
        maleSelected: maleSelected,
        bmi: bmi,
      );
    },
  );
}
