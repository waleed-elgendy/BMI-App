import 'package:bmi_app/shared/user_input_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightAndWeightCard extends StatelessWidget {
  const HeightAndWeightCard({
    super.key,required this.onchange1,required this.onchange2,required this.controller2,required this.controller3
  });
  final void Function(String)? onchange1,onchange2;
  final TextEditingController? controller2,controller3;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: SizedBox(
        height: 230.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 12.h,
            ),
            UserData(
              controller: controller2,
              text1: 'Height',
              text2: "centimeters",
              onChange:onchange1,
              validate: (data) {
                if (data!.isEmpty) {
                  return "field is required";
                }
                return null;
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            UserData(
              controller: controller3,
              text1: 'Weight',
              text2: "Kilograms",
              onChange:onchange2,
              validate: (data) {
                if (data!.isEmpty) {
                  return "field is required";
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
