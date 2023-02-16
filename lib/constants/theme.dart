import 'package:fit/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTheme {
  static final theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.purple,
      backgroundColor: AppColors.white,unselectedWidgetColor: AppColors.purple,
      //scaffoldBackgroundColor:AppColors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme:GoogleFonts.latoTextTheme(
      ).apply(bodyColor: AppColors.white,
        //displayColor: Colors.blue,
      ),

  );
}