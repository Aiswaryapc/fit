import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/home.dart';
import 'package:fit/pages/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:fit/constants/colors.dart';
import 'package:splashscreen/splashscreen.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;
    return SplashScreen(
        navigateAfterSeconds: result != null ? HomePage(uid: result.uid) : SignUp(),
        seconds: 5,
        title: new Text(
          'Welcome To Meet up!',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset('assets/images/dart.png', fit: BoxFit.scaleDown),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("flutter"),
        loaderColor: Colors.red);
  }
}