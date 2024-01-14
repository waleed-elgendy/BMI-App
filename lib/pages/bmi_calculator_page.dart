// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bmi_app/helper/show_snack_bar.dart';
import 'package:bmi_app/helper/store_result_function.dart';
import 'package:bmi_app/shared/age_card.dart';
import 'package:bmi_app/shared/constants.dart';
import 'package:bmi_app/shared/custom_button.dart';
import 'package:bmi_app/shared/gender_row.dart';
import 'package:bmi_app/shared/height_weight_card.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                const GenderRow(),
                SizedBox(height: 12.h),
                AgeCard(
                  controller1: controller1,
                  onchange: (data) {
                    age = double.parse(data);
                  },
                ),
                SizedBox(height: 10.h),
                HeightAndWeightCard(
                  controller2: controller2,
                  controller3: controller3,
                  onchange1: (data) {
                    height = double.parse(data);
                  },
                  onchange2: (data) {
                    weight = double.parse(data);
                  },
                ),
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
                        FocusScope.of(context).unfocus();
                        try {
                          await storeResult(context, widget.user);
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
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
