import 'package:bmi_app/pages/intro_page.dart';
import 'package:bmi_app/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          Future.wait([
            FirebaseAuth.instance.signOut(),
            SharedPreferences.getInstance().then((sharedPrefValue) {
              sharedPrefValue.remove('token');
            })
          ]);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const IntroPage(),
              ),
                  (route) => false);
        },
        icon: Icon(
          Icons.logout,
          color: primaryColor,
          size: 32.r,
        ));
  }
}
