import 'package:fit/Widgets/button.dart';
import 'package:fit/pages/cheekTimer.dart';
import 'package:flutter/material.dart';
import 'package:fit/constants/colors.dart';

class DoubleChin extends StatelessWidget {
  const DoubleChin({Key? key}) : super(key: key);

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
                SizedBox(
                  height: 120,
                ),
                Text(
                  "Under Construction😁!!!",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: AppColors.purple),
                ),
              ],
            ),
          )),
    );
  }
}
