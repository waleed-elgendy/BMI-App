import 'package:bmi_app/pages/bmi_calculator_page.dart';
import 'package:bmi_app/shared/user_input_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightAndWeightCard extends StatelessWidget {
  const HeightAndWeightCard({
    super.key,
  });

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
              onChange: (data) {
                height = double.parse(data);
              },
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
              onChange: (data) {
                weight = double.parse(data);
              },
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
