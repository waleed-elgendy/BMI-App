import 'package:bmi_app/pages/signup_page.dart';
import 'package:bmi_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SignupNeedRow extends StatelessWidget {
  const SignupNeedRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey, fontSize: 15.sp),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ));
          },
          child: Text(
            " Sign up",
            style: TextStyle(color: primaryColor, fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
