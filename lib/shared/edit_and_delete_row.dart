import 'package:bmi_app/models/bmi_model.dart';
import 'package:bmi_app/pages/edit_result_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class EditAndDeleteRow extends StatelessWidget {
  const EditAndDeleteRow({
    super.key,
    required this.resultsList,
    required this.user,
    required this.index,
  });

  final List<BMIModel> resultsList;
  final String user;
  final int index;

  @override
  Widget build(BuildContext context) {
    CollectionReference results =
    FirebaseFirestore.instance.collection('users/$user/results');
    return Expanded(
      child: SizedBox(
        height: 70.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: Icon(Icons.edit, color: Colors.blueAccent, size: 30.r),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return EditResultDetails(
                      result: resultsList[index],
                      user: user,
                    );
                  },
                );
              },
            ),
            GestureDetector(
              child: Icon(Icons.delete, color: Colors.red, size: 30.r),
              onTap: () async {
                await results.doc(resultsList[index].id).delete();
              },
            ),
          ],
        ),
      ),
    );
  }
}
