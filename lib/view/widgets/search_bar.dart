import 'package:elter/view/constants/colors.dart';
import 'package:elter/view/constants/enums.dart';
import 'package:elter/view/constants/constant_words.dart';
import 'package:flutter/material.dart';

IgnorePointer searchBar() {
  return IgnorePointer(
    child: TextField(
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        filled: true,
        fillColor: whiteGrey,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        hintText: searchBarWords[SearchBarWords.searchInStore]!,
        prefixIcon: const Icon(
          Icons.search,
          color: kBlack,
        ),
      ),
    ),
  );
}
