import 'package:elter/presenter/cubit/sort_by/sort_by_cubit.dart';
import 'package:elter/view/constants/colors.dart';
import 'package:elter/view/constants/constant_words.dart';
import 'package:elter/view/constants/enums.dart';

import 'package:flutter/material.dart';

import 'package:elter/entity/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar appBarWithFilter(BuildContext context, int productsLength,
    {Ads? adsObject, String? appBarTitle}) {
  final screenSize = MediaQuery.of(context).size;
  return AppBar(
    title: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: appBarTitle ?? adsObject!.description,
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
        child: BlocBuilder<SortByCubit, SortByState>(
          builder: (context, state) {
            final String groupValue = (state as SortByCalled).sortBy;
            return Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: sortItems
                                .map(
                                  (e) => RadioListTile(
                                    value: e,
                                    groupValue: groupValue,
                                    onChanged: (dynamic val) {
                                      context.read<SortByCubit>().sortBy(val);
                                      Navigator.pop(context);
                                    },
                                    title: Text(e),
                                    activeColor: kPrimaryColor,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      );
                    },
                    child: filterContainer(context,
                        SortingItemNames.sortBy, true, groupValue),
                  ),
                ),
                Expanded(
                  child: filterContainer(
                      context,
                      filterItemNames[FilterItems.filterBy]!,
                      false,
                      groupValue),
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}

List<String> sortItems = [
  SortingItemNames.defaultOrder,
  SortingItemNames.cheapestFirst,
  SortingItemNames.expensiveFirst,
  SortingItemNames.bestsellers,
];

Container filterContainer(
    BuildContext context, String text, bool isSort, String groupValue) {
  return Container(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSort
                  ? const SizedBox()
                  : const Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: Icon(Icons.filter_list),
                    ),
              Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              isSort ? const Icon(Icons.keyboard_arrow_down) : const SizedBox(),
            ],
          ),
          !isSort
              ? const SizedBox()
              : groupValue.isEmpty ||
                      groupValue == SortingItemNames.defaultOrder
                  ? const SizedBox()
                  : Text(
                      groupValue,
                      style: const TextStyle(fontSize: 12),
                    ),
        ],
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
  );
}
