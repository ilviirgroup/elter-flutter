import 'package:elter/view/styles.dart';
import 'package:flutter/material.dart';

import 'package:elter/entity/models.dart';

AppBar appBarWithFilter(BuildContext context, int productsLength,
    {Ads? adsObject, SubCategory? subCategoryObject}) {
  final screenSize = MediaQuery.of(context).size;
  return AppBar(
    title: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: subCategoryObject == null
                ? adsObject!.description
                : subCategoryObject.name,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: ' ($productsLength)',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(screenSize.height / 18),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 18,
        child: Row(
          children: [
            filterContainer("Tertiple"),
            filterContainer("Filtrle"),
          ],
        ),
      ),
    ),
  );
}

Expanded filterContainer(String text) {
  return Expanded(
    child: Container(
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      decoration: const BoxDecoration(
        color: kWhite,
        border: Border(
          left: BorderSide(width: 1, color: kScaffoldBackgroundColor),
          top: BorderSide(width: 2, color: kScaffoldBackgroundColor),
          right: BorderSide(width: 1, color: kScaffoldBackgroundColor),
        ),
      ),
    ),
  );
}
