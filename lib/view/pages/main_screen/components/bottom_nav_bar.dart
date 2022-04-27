import 'package:flutter/material.dart';

import '../../../../utils/constants/constants.dart';
import 'bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.bottomNavScreen,
    required this.screenSize,
  }) : super(key: key);

  final BottomNavScreen bottomNavScreen;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BottomNavItem(
              index: BottomNavScreen.home,
              currentIndex: bottomNavScreen,
              label: bottomNavigationIconLabels[BottomNavScreen.home]!,
              icon: Icons.home_outlined,
            ),
            BottomNavItem(
              index: BottomNavScreen.vendors,
              currentIndex: bottomNavScreen,
              label:
                  bottomNavigationIconLabels[BottomNavScreen.vendors]!,
              icon: Icons.storefront_outlined,
            ),
            SizedBox(
              width: screenSize.width / 5,
            ),
            BottomNavItem(
              index: BottomNavScreen.catalog,
              currentIndex: bottomNavScreen,
              label:
                  bottomNavigationIconLabels[BottomNavScreen.catalog]!,
              icon: Icons.dashboard_outlined,
            ),
            BottomNavItem(
              index: BottomNavScreen.profile,
              currentIndex: bottomNavScreen,
              label:
                  bottomNavigationIconLabels[BottomNavScreen.profile]!,
              icon: Icons.person_outline,
            ),
          ],
        ),
      ),
    );
  }
}
