import 'package:bmi_app/pages/bmi_calculator_page.dart';
import 'package:bmi_app/pages/past_results_page.dart';
import 'package:bmi_app/shared%20widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int selectIndex = 0;
List<Widget> pages = [
  const BMICalculatorPage(),
  const PastResultPage()
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
