import 'package:elter/view/styles.dart';
import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
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
        backgroundColor: kWhite, foregroundColor: kBlack, elevation: 0),
    tabBarTheme: const TabBarTheme(
      labelStyle:
          TextStyle(color: kBlack, fontSize: 16.0, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          TextStyle(color: kGrey, fontSize: 16.0, fontWeight: FontWeight.w600),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kBlack,
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite));
