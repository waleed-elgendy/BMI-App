// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bmi_app/helper/show_snack_bar.dart';
import 'package:bmi_app/pages/home_page.dart';
import 'package:bmi_app/pages/signup_page.dart';
import 'package:bmi_app/shared%20widgets/constants.dart';
import 'package:bmi_app/shared%20widgets/custom_button.dart';
import 'package:bmi_app/shared%20widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                CustomTextField(
                  validate: (data) {
                    if (data!.isEmpty) {
                      return "field is required";
                    }
                    return null;
                  },
                  onchange: (data) {
                    email = data;
                  },
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
                          style:
                              TextStyle(color: primaryColor, fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                CustomTextField(
                  validate: (data) {
                    if (data!.isEmpty) {
                      return "field is required";
                    }
                    return null;
                  },
                  onchange: (data) {
                    pass = data;
                  },
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
                          style:
                              TextStyle(color: primaryColor, fontSize: 20.sp),
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
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomButton(
                  text: "Sign in",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await loginUser();
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage(
                              /*user: email!,*/
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
                SizedBox(
                  height: 10.h,
                ),
                Row(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: pass!);
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token.toString());
    await prefs.setString('user', email!);
  }
}
