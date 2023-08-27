import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/pages/home.dart';
import 'package:fit/pages/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:fit/constants/colors.dart';

class IntroPage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<IntroPage> {
  User? result = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  result != null ? HomePage(uid: result?.uid) : SignUpScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [AppColors.bglight, AppColors.white])),
                child:Center(
                  child: const Text(
                      "Fit",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: AppColors.purple),
                    ),
                ),
      ),
    );
  }
}
