import 'package:elter/entity/models/ads.dart';
import 'package:elter/presenter/cubit/change_home_screens/change_home_screens_cubit.dart';
import 'package:elter/presenter/cubit/temporary_ads_object/temporary_ads_object_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsListItem extends StatelessWidget {
  const AdsListItem({
    Key? key,
    required this.adsItem,
  }) : super(key: key);

  final Ads adsItem;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        context.read<TemporaryAdsObjectCubit>().temporaryAdsObject(adsItem);
        context.read<ChangeHomeScreensCubit>().changeHomeScreen(1);
      },
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(adsItem.photo)),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        margin: const EdgeInsets.fromLTRB(10, 1.5, 10, 1.5),
        height: screenSize.height / 6,
      ),
    );
  }
}
