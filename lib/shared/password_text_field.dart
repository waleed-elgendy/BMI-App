import 'package:bmi_app/shared/constants.dart';
import 'package:bmi_app/shared/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key, required this.onchange,
  });

 final void Function(String?)? onchange;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}
bool passobsure = true;

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validate: (data) {
        if (data!.isEmpty) {
          return "field is required";
        }
        return null;
      },
      onchange: widget.onchange,
      hint: "Enter your Password",
      obscure: passobsure,
      fill: false,
      textColor: primaryColor,
      label: SizedBox(
        width: 135.w,
        child: Row(
          children: [
            Icon(
              Icons.lock,
              color: primaryColor,
              size: 30.r,
            ),
            Text(
              "  Password",
              style: TextStyle(color: primaryColor, fontSize: 20.sp),
            ),
          ],
        ),
      ),
      suffix: InkWell(
        highlightColor: const Color(0xffF8F8F8),
        splashColor: const Color(0xffF8F8F8),
        child: Icon(
          passobsure ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
        onTap: () {
          setState(() {
          passobsure = !passobsure;
          });
        },
      ),
    );
  }
}
