// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bmi_app/helper/show_snack_bar.dart';
import 'package:bmi_app/helper/signin_signup_functions.dart';
import 'package:bmi_app/pages/signin_page.dart';
import 'package:bmi_app/shared/constants.dart';
import 'package:bmi_app/shared/custom_button.dart';
import 'package:bmi_app/shared/email_text_field.dart';
import 'package:bmi_app/shared/have_account_row.dart';
import 'package:bmi_app/shared/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email, pass;
  bool passobsure = true, isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 35,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: primaryColor, size: 32.r),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              reverse: true,
              padding: EdgeInsets.zero,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 45.h),
                    child: Image.asset("assets/signin.jpg", height: 340.h),
                  ),
                ),
                Text(
                  "Create your Account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 38.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Let's be our member",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 15.h),
                EmailTextField(
                  onchange: (data) {
                    email = data;
                  },
                ),
                SizedBox(height: 12.h),
                PasswordTextField(
                  onchange: (data) {
                    pass = data;
                  },
                ),
                SizedBox(height: 15.h),
                CustomButton(
                  text: "Sign Up",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(
                        () {
                          isLoading = true;
                        },
                      );
                      try {
                        await registerUser(email: email!, pass: pass!);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInPage(),
                            ));
                        showSnackBar(
                            context,
                            "Registration Success you can Login Now",
                            "success",
                            ContentType.success);
                      } catch (e) {
                        if (e.toString().length == 92) {
                          showSnackBar(context, e.toString().substring(36),
                              "Registration failed", ContentType.failure);
                        } else {
                          print(e);
                          showSnackBar(context, e.toString().substring(30),
                              "Registration failed", ContentType.failure);
                        }
                      }
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  color: primaryColor,
                  textColor: Colors.white,
                  hPadding: 60.w,
                ),
                SizedBox(height: 10.h),
                const HaveAccountRow(),
                SizedBox(height: 15.h),
              ].reversed.toList(),
            ),
          ),
        ),
      ),
    );
  }
}
