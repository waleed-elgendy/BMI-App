import 'package:bmi_app/pages/signin_page.dart';
import 'package:bmi_app/shared%20widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 45.h),
                child: Image.asset("assets/intro.jpg", height: 340.h),
              ),
            ),
            Text(
              "Welcome to BMI Cal+",
              style: TextStyle(
                color: Colors.black,
                fontSize: 36.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Best guide for calculating\n   your body mass index.",
              style: TextStyle(
                color: Colors.grey.shade900,
                fontSize: 26.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 135.h),
            CustomButton(
              text: "Sign in",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ));
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            const CustomButton(
              text: "Sign up",
              color: Colors.white,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
