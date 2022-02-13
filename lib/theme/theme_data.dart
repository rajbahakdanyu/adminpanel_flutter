import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/constants/constant.dart';

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dividerColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    textTheme: Typography.whiteCupertino.copyWith(
      bodyText1: GoogleFonts.nunitoSans(),
      bodyText2: GoogleFonts.nunitoSans(),
      button: GoogleFonts.nunitoSans(),
      headline5: GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
      ),
      headline6: GoogleFonts.nunitoSans(
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
