import 'package:flutter/material.dart';

enum PageType {welcome, home, categories, profile, season, shoppingCart }

abstract class PageContainerBase extends StatelessWidget {
  Widget get body;

  String get pageTitle;

  AppBar get appBar;

  Widget get background;

  const PageContainerBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: body,
      ),
    );
  }
}
