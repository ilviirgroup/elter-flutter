// ulgama girmek ahypasy

import 'package:flutter/material.dart';

const kScaffoldBackgroundColor = Color(0xFFF7F7F7); // #f7f7f7
double mainPagePadding = 5.0;
double appNameBoxWidth = 65;
double loginBoxVarticalPadding = 15.0, loginBoxhorizontalPadding = 20.0;
const kWhite = Color(0xFFFFFFFF);
const kBlack = Color(0xFF000000);
const kGrey = Color(0xFF6e6c6c);
const whiteGrey = Color.fromARGB(28, 122, 120, 120);

var ulgamaGirmekTextStyle =
    const TextStyle(fontSize: 14, fontWeight: FontWeight.w700);
double ulgamaGirmekTextMarginHorizontal = 10.0;

var kPrimaryColor = const Color(0xFF7A4792); // #7a4792

var kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
  border: const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFD3D3D3),
    ), // #d3d3d3
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
  ),
);

var checkBoxBorderRadius = 2.0;
