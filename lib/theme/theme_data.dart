import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/constants/colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primaryColor,
    textTheme: Typography.whiteCupertino.copyWith(
      bodyText2: GoogleFonts.nunitoSans(color: Colors.white),
      bodyText1: GoogleFonts.nunitoSans(color: Colors.white),
      button: GoogleFonts.nunitoSans(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryAccent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryAccent,
      elevation: 0,
      splashColor: Colors.transparent,
      highlightElevation: 0,
    ),
  );
}
