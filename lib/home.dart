import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/pages/cheekTimer.dart';
import 'package:fit/pages/doubleChin.dart';
import 'package:fit/pages/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:fit/constants/colors.dart';

import 'Widgets/button.dart';
import 'pages/armTimer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.uid}) : super(key: key);
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
          body: Stack(
            
            children:[ Center(
          
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 90,
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
                  ButtonWidget(
                    text: 'Arm Workout',
                    backgroundColor: AppColors.gold,
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ArmTimerPage()),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                    text: 'Cheek Workout',
                    backgroundColor: AppColors.gold,
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheekTimerPage()),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                    text: 'Double chin Workout',
                    backgroundColor: AppColors.gold,
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DoubleChin()),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                    text: 'Leg Workout',
                    backgroundColor: AppColors.gold,
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DoubleChin()),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                    text: 'Abs Workout',
                    backgroundColor: AppColors.gold,
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DoubleChin()),
                      );
                    },
                  ),
                ],
              ),
            ),
            
                  Padding(
                    padding: const EdgeInsets.only(left: 330,right: 10,top: 60),
                    child: InkWell(
                      onTap: (){
                        FirebaseAuth auth = FirebaseAuth.instance;
        auth.signOut().then((res) {
           Navigator.pushAndRemoveUntil(
                context,
               MaterialPageRoute(builder: (context) => SignUpScreen()),
              (Route<dynamic> route) => false);
           });
                      },
                      child: const Text(
                       "Logout",
                       style: TextStyle(
                           fontSize: 16,
                           decoration: TextDecoration.underline,
                           fontWeight: FontWeight.w600,
                           color: AppColors.purple),
                                    ),
                    ),
                  ),]
          )),
    );
  }
}
