import 'package:flutter/material.dart';

import '../styles.dart';

AppBar appBarWithTabBar(BuildContext context, List tabItems) {
  final screenSize = MediaQuery.of(context).size;
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: screenSize.width - 20,
          height: screenSize.height,
          child: const TextField(
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              filled: true,
              fillColor: whiteGrey,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              hintText: """"Elter" arkaly gözle""",
              prefixIcon: Icon(
                Icons.search,
                color: kBlack,
              ),
            ),
          ),
        ),
      ),
    ],
    bottom: TabBar(
      labelColor: Colors.black,
      indicatorColor: kPrimaryColor,
      isScrollable: true,
      tabs: [const Tab(
        text: 'Ähli arzanlar',
      ), 
        ...tabItems.map((tabs) => Tab(
              text: tabs.name,
            ))
      ],
    ),
  );
}
