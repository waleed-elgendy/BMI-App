// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bmi_app/helper/show_snack_bar.dart';
import 'package:bmi_app/helper/signin_signup_functions.dart';
import 'package:bmi_app/pages/home_page.dart';
import 'package:bmi_app/shared/constants.dart';
import 'package:bmi_app/shared/custom_button.dart';
import 'package:bmi_app/shared/email_text_field.dart';
import 'package:bmi_app/shared/password_text_field.dart';
import 'package:bmi_app/shared/signup_need_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? email, pass;
  bool isLoading = false;
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
              padding: EdgeInsets.zero,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 45.h),
                    child: Image.asset("assets/signin.jpg", height: 340.h),
                  ),
                ),
                Text(
                  "Welcome !",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in to continue",
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
                  text: "Sign in",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await loginUser(email: email!, pass: pass!);
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage(
                            user: email!,
                          );
                        }), (route) => false);
                      } catch (e) {
                        showSnackBar(
                            context,
                            "check email or password and try again",
                            "Login failed",
                            ContentType.failure);
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
                const SignupNeedRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
