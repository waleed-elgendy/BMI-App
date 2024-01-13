import 'package:bmi_app/shared/user_input_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgeCard extends StatelessWidget {
  const AgeCard({
    super.key,
    required this.onchange,
    required this.controller1,
  });
  final void Function(String)? onchange;
  final TextEditingController? controller1;
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
            onChange: onchange,
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
