import 'package:elter/view/styles.dart';
import 'package:flutter/material.dart';

IgnorePointer searchBar() {
  return const IgnorePointer(
    child: TextField(
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        filled: true,
        fillColor: whiteGrey,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        hintText: """Elterde gözle""",
        prefixIcon: Icon(
          Icons.search,
          color: kBlack,
        ),
      ),
    ),
  );
}
