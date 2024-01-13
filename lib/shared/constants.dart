import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
const Color primaryColor = Color(0xff4A3780);

 List<Widget> details=[
  Text("age",
      style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold)),
  Text("height",
      style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold)),
   Text("weight",
       style: TextStyle(
           fontSize: 18.sp,
           fontWeight: FontWeight.bold)),
   Text("BMI",
       style: TextStyle(
           fontSize: 18.sp,
           fontWeight: FontWeight.bold,color: Colors.red)),
];