import 'package:bmi_app/shared/constants.dart';
import 'package:bmi_app/shared/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.onchange,
  });
  final void Function(String?)? onchange;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validate: (data) {
        if (data!.isEmpty) {
          return "field is required";
        }
        return null;
      },
      onchange: onchange,
      obscure: false,
      hint: "Enter your E-mail",
      textColor: primaryColor,
      keyType: TextInputType.emailAddress,
      fill: false,
      label: SizedBox(
        width: 103.w,
        child: Row(
          children: [
            Icon(
              Icons.email_outlined,
              color: primaryColor,
              size: 30.r,
            ),
            Text(
              "  E-mail",
              style: TextStyle(color: primaryColor, fontSize: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
