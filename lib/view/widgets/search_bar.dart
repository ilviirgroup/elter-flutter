import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';

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
