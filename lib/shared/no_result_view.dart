import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants.dart';

class NoResult extends StatelessWidget {
  const NoResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            "No Result found\nCalculate your BMI now",
            style: TextStyle(
                color: primaryColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
