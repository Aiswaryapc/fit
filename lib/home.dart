import 'package:flutter/material.dart';
import 'package:fit/constants/colors.dart';

import 'Widgets/button.dart';
import 'Widgets/timer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  height: 220,
                ),
                   Text(
                      "Welcome!!!",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: AppColors.purple),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                ButtonWidget(
                  text: 'Arm Workout',
                  backgroundColor: AppColors.gold,
                  onClicked: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StopWatchTimerPage()),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
