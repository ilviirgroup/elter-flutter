import 'package:elter/view/widgets/search_field.dart';
import 'package:flutter/material.dart';

AppBar appBarWithSearch(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  return AppBar(
    flexibleSpace: const Padding(
      padding: EdgeInsets.all(8.0),
      child: SearchField(),
    ),
  );
}
