import 'package:bmi_app/shared%20widgets/constants.dart';
import 'package:bmi_app/shared%20widgets/custom_button.dart';
import 'package:bmi_app/shared%20widgets/gender_card.dart';
import 'package:bmi_app/shared%20widgets/user_input_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({Key? key}) : super(key: key);

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

int gender = 1;
bool maleSelected = true, femaleSelected = false;

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GenderCard(
                  isSelected: maleSelected,
                  color: Colors.lightBlue,
                  icon: Icons.male,
                  gender: "Male",
                  onTap: () {
                    setState(() {
                      maleSelected = true;
                      femaleSelected = false;
                    });
                  },
                ),
                GenderCard(
                  isSelected: femaleSelected,
                  color: Colors.pinkAccent,
                  icon: Icons.female,
                  gender: "Female",
                  onTap: () {
                    setState(() {
                      maleSelected = false;
                      femaleSelected = true;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Card(
              color: Colors.white,
              elevation: 1,
              child: SizedBox(
                height: 110.h,
                child: Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: const UserData(text1: 'Age', text2: "years"),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Card(
              color: Colors.white,
              elevation: 1,
              child: SizedBox(
                height: 210.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    const UserData(text1: 'Height', text2: "centimeters"),
                    SizedBox(
                      height: 10.h,
                    ),
                    const UserData(text1: 'Weight', text2: "Kilograms"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomButton(
              text: "Calculate",
              color: primaryColor,
              textColor: Colors.white,
              hPadding: 32.w,
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
