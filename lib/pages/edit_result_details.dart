// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bmi_app/helper/edit_result_function.dart';
import 'package:bmi_app/helper/show_snack_bar.dart';
import 'package:bmi_app/models/bmi_model.dart';
import 'package:bmi_app/shared/age_card.dart';
import 'package:bmi_app/shared/constants.dart';
import 'package:bmi_app/shared/custom_button.dart';
import 'package:bmi_app/shared/height_weight_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditResultDetails extends StatefulWidget {
  EditResultDetails({Key? key, required this.result, required this.user})
      : super(key: key);

  BMIModel result;
  final String user;
  @override
  State<EditResultDetails> createState() => _EditResultDetailsState();
}

class _EditResultDetailsState extends State<EditResultDetails> {
  double age = 0, height = 0, weight = 0;


  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    age = widget.result.age;
    height = widget.result.height;
    weight = widget.result.weight;
    controller1.text = widget.result.age.toInt().toString();
    controller2.text = widget.result.height.toInt().toString();
    controller3.text = widget.result.weight.toInt().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 155.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22.r)),
          color: Colors.white),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Form(
            key: formKey,
            child: Column(
              children: [
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
                    text: "Save",
                    color: primaryColor,
                    textColor: Colors.white,
                    hPadding: 32.w,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          await editResult(
                              context: context,
                              height: height,
                              user: widget.user,
                              age: age,
                              weight: weight,
                              id: widget.result.id,
                              createdAt: widget.result.createdAt);
                        } catch (e) {
                          showSnackBar(
                            context,
                            "try again",
                            "failed",
                            ContentType.failure,
                          );
                        }
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
