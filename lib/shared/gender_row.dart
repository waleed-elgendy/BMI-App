import 'package:bmi_app/pages/bmi_calculator_page.dart';
import 'package:bmi_app/shared/gender_card.dart';
import 'package:flutter/material.dart';

class GenderRow extends StatefulWidget {
  const GenderRow({Key? key}) : super(key: key);

  @override
  State<GenderRow> createState() => _GenderRowState();
}

class _GenderRowState extends State<GenderRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
