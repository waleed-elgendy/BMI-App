import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.color,
    required this.gender,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });
  final Color color;
  final String gender;
  final IconData icon;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                isSelected ? Border.all(color: Colors.blue, width: 3) : null,
            borderRadius: BorderRadius.all(Radius.circular(18.r))),

        //elevation: 1,
        child: Padding(
          padding: EdgeInsets.only(bottom: 5.0.h),
          child: Column(
            children: [
              Icon(
                icon,
                color: color,
                size: 160.r,
              ),
              Text(gender,
                  style: TextStyle(
                      color: Colors.black, fontSize: 22.sp, height: 0)),
            ],
          ),
        ),
      ),
    );
  }
}
