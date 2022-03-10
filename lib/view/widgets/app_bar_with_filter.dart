import 'package:flutter/material.dart';

import 'package:elter/entity/models.dart';

AppBar appBarWithFilter(
    BuildContext context, Ads adsObject, int productsLength) {
  final screenSize = MediaQuery.of(context).size;
  return AppBar(
    title: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: adsObject.description,
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
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
    ),
  );
}
