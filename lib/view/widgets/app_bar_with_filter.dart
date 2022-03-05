import 'package:elter/entity/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elter/presenter/cubit.dart';

AppBar appBarWithFilter(BuildContext context, Ads adsObject) {
  final screenSize = MediaQuery.of(context).size;
  return AppBar(
    leading: IconButton(
      onPressed: () {
        context.read<ChangeHomeScreensCubit>().changeHomeScreen(0);
        context.read<ChangeBottomNavCubit>().changeBottomNavIndex(0);
        context.read<AdsProductCubit>().initializeAdsProductCubit();
      },
      icon: const Icon(Icons.arrow_back),
    ),
    title: Text(adsObject.description),
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
