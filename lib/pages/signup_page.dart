// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bmi_app/helper/show_snack_bar.dart';
import 'package:bmi_app/pages/signin_page.dart';
import 'package:bmi_app/shared/constants.dart';
import 'package:bmi_app/shared/custom_button.dart';
import 'package:bmi_app/shared/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 115.h,
                ),
                Text(
                  "Create your\nAccount",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.sp,
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
                SizedBox(height: 230.h),
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
                  fill: false,
                  textColor: primaryColor,
                  obscure: passobsure,
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
                  text: "Sign Up",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(
                        () {
                          isLoading = true;
                        },
                      );
                      try {
                        await registerUser();
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
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        " Sign in",
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

  Future<void> registerUser()  async {
    await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: pass!);
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.doc(email).set({
      'email': email,
    });

  }
}
