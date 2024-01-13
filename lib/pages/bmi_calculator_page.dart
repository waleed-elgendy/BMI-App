// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bmi_app/helper/show_snack_bar.dart';
import 'package:bmi_app/helper/store_result_function.dart';
import 'package:bmi_app/shared/age_card.dart';
import 'package:bmi_app/shared/constants.dart';
import 'package:bmi_app/shared/custom_button.dart';
import 'package:bmi_app/shared/gender_row.dart';
import 'package:bmi_app/shared/height_weight_card.dart';
import 'package:bmi_app/shared/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({Key? key, required this.user}) : super(key: key);

  final String user;

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

int gender = 1;
bool maleSelected = false, femaleSelected = false;
GlobalKey<FormState> formKey = GlobalKey();
double age = 0, height = 0, weight = 0;
double bmi = 0;
TextEditingController controller1 = TextEditingController();
TextEditingController controller2 = TextEditingController();
TextEditingController controller3 = TextEditingController();

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32.sp),
        ),
        actions: const [
          LogOutButton()
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const GenderRow(),
              SizedBox(height: 12.h),
              const AgeCard(),
              SizedBox(height: 10.h),
              const HeightAndWeightCard(),
              SizedBox(height: 15.h),
              CustomButton(
                text: "Calculate",
                color: primaryColor,
                textColor: Colors.white,
                hPadding: 32.w,
                onTap: () async {
                  if (!maleSelected && !femaleSelected) {
                    showSnackBar(context, "please choose your gender",
                        "failed to calculate BMI", ContentType.failure);
                  } else {
                    if (formKey.currentState!.validate()) {
                      try {
                        await storeResult(context,widget.user);
                      } catch (e) {
                        showSnackBar(
                          context,
                          "try again",
                          "failed",
                          ContentType.failure,
                        );
                      }
                    }
                  }
                },
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}

