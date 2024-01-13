import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserData extends StatelessWidget {
  const UserData({
    super.key,
    required this.text1,
    required this.text2,required this.onChange,required this.validate,required this.controller,
  });
  final String text1, text2;
  final void Function(String)? onChange;
  final String? Function(String?)? validate;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(
              width: 50.w,
            ),
            SizedBox(
              width: 85.w,
              child: Text(
                "$text1 :",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 65.w),
                  child: TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    onChanged: onChange,
                    validator: validate,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade400,
                      filled: true,
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 3.5),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.r),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.r),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.r),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: SizedBox(
            width: 220.w,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "($text2)",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp),
              ),
            ),
          ),
        )
      ],
    );
  }
}
