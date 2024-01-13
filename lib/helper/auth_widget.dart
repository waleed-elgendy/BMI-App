import 'package:bmi_app/pages/home_page.dart';
import 'package:bmi_app/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  String? token,user;
  bool initial = true;
  @override
  Widget build(BuildContext context) {
    if (initial) {
      SharedPreferences.getInstance().then((sharedPrefValue) {
        setState(() {
          initial = false;
          token = sharedPrefValue.getString('token');
          user = sharedPrefValue.getString('user');
        });
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    } else {
      if (token == null) {
        return const IntroPage();
    }else {
      return  HomePage(user: user!,selectIndex: 0,);
    }
  }
}
}