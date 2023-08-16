import 'package:fit/pages/cheekTimer.dart';
import 'package:fit/pages/doubleChin.dart';
import 'package:flutter/material.dart';
import 'package:fit/constants/colors.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key, this.uid}) : super(key: key);
  final String? uid;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [AppColors.bglight, AppColors.white])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120,
                ),
                const Text(
                  "Welcome!!!",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: AppColors.purple),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          )),
    );
  }
}
