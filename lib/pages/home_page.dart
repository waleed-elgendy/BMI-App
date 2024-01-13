import 'package:bmi_app/pages/bmi_calculator_page.dart';
import 'package:bmi_app/pages/past_results_page.dart';
import 'package:bmi_app/shared/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final String user;

  @override
  State<HomePage> createState() => _HomePageState();
}

int selectIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      BMICalculatorPage(user: widget.user),
      const PastResultPage()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectIndex: selectIndex,
        onTap: (index) {
          setState(
            () {
              selectIndex = index;
            },
          );
        },
      ),
      body: pages[selectIndex],
    );
  }
}
