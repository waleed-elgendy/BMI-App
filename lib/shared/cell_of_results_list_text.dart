import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CellText extends StatelessWidget {
  const CellText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        textAlign: TextAlign.center,
      ),
    );
  }
}