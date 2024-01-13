import 'package:cloud_firestore/cloud_firestore.dart';

class BMIModel {
  final double age, weight, height;
  final String id, result;
  final Timestamp createdAt;
  BMIModel(
      {required this.age,
      required this.weight,
      required this.height,
      required this.result,
      required this.id,
      required this.createdAt});

  factory BMIModel.fromJson(jsonData) {
    return BMIModel(
        age: jsonData['age'],
        weight: jsonData['weight'],
        height: jsonData['height'],
        result: jsonData['result'],
        id: jsonData['id'],
        createdAt: jsonData['createdAt']);
  }
}
