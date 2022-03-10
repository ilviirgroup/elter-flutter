import 'package:elter/view/styles.dart';
import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
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
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: kWhite,
      foregroundColor: kBlack,
    ),
    tabBarTheme: const TabBarTheme(
      labelStyle:
          TextStyle(color: kBlack, fontSize: 16.0, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(
          color: textGreyColor, fontSize: 16.0, fontWeight: FontWeight.w600),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kBlack,
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: kPrimaryColor));
