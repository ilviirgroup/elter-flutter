import 'package:elter/view/constants/styles.dart';
import 'package:flutter/material.dart';

AppBar simpleAppBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: boldTextStyle,
    ),
  );
}
