import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key, required this.maleSelected, required this.bmi,
  });
 final bool maleSelected;
 final double bmi;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 50.w, vertical: 250.h),
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.all(Radius.circular(22.r)),
          color: Colors.white),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Text(
              bmi < 18.5
                  ? "Under Weight"
                  : bmi < 24.9
                  ? "Normal Weight"
                  : bmi < 29.9
                  ? "Over Weight"
                  : bmi < 34.9
                  ? "Obesity"
                  : "Extreme Obesity",
              style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            maleSelected
                ? Container(
              padding:
              EdgeInsets.symmetric(vertical: 10.h),
              height: 180.h,
              width: 180.w,
              child: Image.asset(
                bmi < 18.5
                    ? "assets/munder.jpg"
                    : bmi < 24.9
                    ? "assets/mnor.jpg"
                    : bmi < 29.9
                    ? "assets/mover.jpg"
                    : bmi < 34.9
                    ? "assets/mob.jpg"
                    : "assets/mexob.jpg",
              ),
            )
                : Container(
              padding:
              EdgeInsets.symmetric(vertical: 10.h),
              height: 180.h,
              width: 180.w,
              child: Image.asset(
                bmi < 18.5
                    ? "assets/funder.jpg"
                    : bmi < 24.9
                    ? "assets/fnor.jpg"
                    : bmi < 29.9
                    ? "assets/fover.jpg"
                    : bmi < 34.9
                    ? "assets/fob.jpg"
                    : "assets/fexob.jpg",
              ),
            ),
            Text(
              bmi.toStringAsFixed(1),
              style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
