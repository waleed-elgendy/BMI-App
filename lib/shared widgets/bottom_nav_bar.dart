import 'package:bmi_app/shared%20widgets/nav_bar_icon.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key, required this.selectIndex, required this.onTap})
      : super(key: key);
  int selectIndex;
  void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        elevation: 0,
        currentIndex: selectIndex,
        enableFeedback: false,
        onTap: onTap,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xff001C38),
        items: [
          BottomNavigationBarItem(
            icon: NavBarIcon(
              icon: Icons.monitor_weight_outlined,
              index: 0,
              selectIndex: selectIndex,
            ),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(
              icon: Icons.list_alt_outlined,
              index: 1,
              selectIndex: selectIndex,
            ),
            label: 'Past Results',
          ),
        ],
      ),
    );
  }
}
