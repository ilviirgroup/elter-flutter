import 'package:flutter/material.dart';
import 'app_colors.dart';

double mainPagePadding = 5.0;
double appNameBoxWidth = 65;
double loginBoxVarticalPadding = 15.0, loginBoxhorizontalPadding = 20.0;
var checkBoxBorderRadius = 2.0;

// var ulgamaGirmekTextStyle =
//     const TextStyle(fontSize: 14, fontWeight: FontWeight.w700);

// double ulgamaGirmekTextMarginHorizontal = 10.0;

const TextStyle boldTextStyle = TextStyle(fontWeight: FontWeight.w700);

const TextStyle greenTextStyle =
    TextStyle(color: kGreen, fontWeight: FontWeight.bold);

const TextStyle semiBoldTextStyle = TextStyle(fontWeight: FontWeight.w600);

const TextStyle inputTextStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

const kTextFieldDecoration = InputDecoration(
    hintText: 'Enter a value',
    hintStyle: TextStyle(fontSize: 16),
    contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFFD3D3D3),
      ), // #d3d3d3
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    prefixStyle: TextStyle(
        color: textGreyColor, fontSize: 18, fontWeight: FontWeight.w600));

const TextStyle priceStyle =
    TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor);

const TextStyle discountedPriceStyle =
    TextStyle(fontWeight: FontWeight.bold, color: textRedColor);

const TextStyle oldPriceStyle = TextStyle(
    color: textGreyColor, decoration: TextDecoration.lineThrough, fontSize: 12);
