import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TopResultsListContainer extends StatelessWidget {
  const TopResultsListContainer({
    super.key, required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 5.3).w,
      height: 70.h,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black)),
      child: child,
    );
  }
}
