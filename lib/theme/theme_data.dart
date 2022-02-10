import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/constants/colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primaryColor,
    dividerColor: Colors.transparent,
    hoverColor: Colors.transparent,
    textTheme: Typography.blackCupertino.copyWith(
      bodyText2: GoogleFonts.nunitoSans(),
      bodyText1: GoogleFonts.nunitoSans(),
      button: GoogleFonts.nunitoSans(),
      headline5: GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
      ),
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
