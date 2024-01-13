import 'package:bmi_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      this.onTap,
      this.color = primaryColor,
      this.textColor = Colors.white,
      this.hPadding=0})
      : super(key: key);
  final String text;
  final VoidCallback? onTap;
  final Color? color, textColor;
  final double hPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: hPadding.h),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50.dm),
            border: Border.all(color: primaryColor,width: 1.5)
          ),
          height: 55.h,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 25.sp),
            ),
          ),
        ),
      ),
    );
  }
}
