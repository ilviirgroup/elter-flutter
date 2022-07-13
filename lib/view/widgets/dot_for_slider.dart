import 'package:flutter/material.dart';

class DotForSlider extends StatelessWidget {
  const DotForSlider({
    Key? key,
    required this.page,
    required this.index,
  }) : super(key: key);

  final int page;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: index == page ? 12 : 9,
      width: index == page ? 12 : 9,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          shape: BoxShape.circle,
          color: index == page ? Colors.black : Colors.grey[600]),
    );
  }
}
