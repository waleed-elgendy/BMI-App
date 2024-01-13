import 'package:bmi_app/pages/bmi_calculator_page.dart';
import 'package:bmi_app/shared/user_input_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AgeCard extends StatelessWidget {
  const AgeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: SizedBox(
        height: 135.h,
        child: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: UserData(
            controller: controller1,
            text1: 'Age',
            text2: "years",
            onChange: (data) {
              age = double.parse(data);
            },
            validate: (data) {
              if (data!.isEmpty) {
                return "field is required";
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
