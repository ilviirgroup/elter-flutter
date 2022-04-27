import 'package:flutter/material.dart';

import 'constants/app_colors.dart';

const String myFontFamily = 'Source Sans Pro';

final ThemeData myTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    backgroundColor: kWhite,
    foregroundColor: kBlack,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kBlack,
      type: BottomNavigationBarType.fixed,
      backgroundColor: kWhite),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: kPrimaryColor,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      elevation: 0.0,
      textStyle: const TextStyle(
          color: kScaffoldBackgroundColor,
          fontSize: 16,
          fontWeight: FontWeight.w700),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
  ),
  focusColor: Colors.transparent,
  fontFamily: myFontFamily,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kScaffoldBackgroundColor,
  scrollbarTheme: const ScrollbarThemeData(),
  tabBarTheme: const TabBarTheme(
    labelStyle: TextStyle(
        color: kBlack,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        fontFamily: myFontFamily),
    unselectedLabelStyle: TextStyle(
        color: textGreyColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        fontFamily: myFontFamily),
  ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: kPrimaryColor),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
