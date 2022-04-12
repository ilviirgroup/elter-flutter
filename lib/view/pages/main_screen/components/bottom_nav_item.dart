import 'package:elter/presenter/cubit.dart';
import 'package:elter/view/constants/colors.dart';
import 'package:elter/view/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavItem extends StatelessWidget {
  final BottomNavScreen index;
  final BottomNavScreen currentIndex;
  final String label;
  final IconData icon;
  const BottomNavItem({
    Key? key,
    required this.index,
    required this.currentIndex,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final changeBottomNavCubit = context.read<ChangeBottomNavCubit>();
    return Expanded(
      child: GestureDetector(
        onTap: () {
          changeBottomNavCubit.changeBottomNavIndex(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color:
                  currentIndex == index ? kPrimaryColor : unselectedIconColor,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: currentIndex == index
                        ? kPrimaryColor
                        : unselectedIconColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
