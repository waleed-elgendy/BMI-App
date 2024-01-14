// ignore_for_file: must_be_immutable

import 'package:bmi_app/pages/bmi_calculator_page.dart';
import 'package:bmi_app/pages/past_results_page.dart';
import 'package:bmi_app/shared/bottom_nav_bar.dart';
import 'package:bmi_app/shared/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.user, required this.selectIndex})
      : super(key: key);
  final String user;
  int selectIndex = 0;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      BMICalculatorPage(user: widget.user),
      PastResultPage(user: widget.user)
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.selectIndex == 0 ? "BMI Calculator" : "Your Results",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32.sp),
        ),
        actions: const [LogOutButton()],
      ),
      bottomNavigationBar: BottomNavBar(
        selectIndex: widget.selectIndex,
        onTap: (index) {
          setState(() {
            widget.selectIndex = index;
          });
        },
      ),
      body: pages[widget.selectIndex],
    );
  }
}
