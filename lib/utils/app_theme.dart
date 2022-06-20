import 'package:flutter/material.dart';

import 'constants/app_colors.dart';



const String myFontFamily = 'Source Sans Pro';

final ThemeData myTheme = ThemeData(
  primarySwatch: const MaterialColor(
    0xFF7A4792, // kPrimaryColor
    <int, Color>{
      50: Color(0xFFF3E5F5),
      100: Color(0xFFE1BEE7),
      200: Color(0xFFCE93D8),
      300: Color(0xFFBA68C8),
      400: Color(0xFFAB47BC),
      500: Color(0xFF9C27B0),
      600: Color(0xFF8E24AA),
      700: Color(0xFF7B1FA2),
      800: Color(0xFF6A1B9A),
      900: Color(0xFF4A148C),
    },
  ),
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
