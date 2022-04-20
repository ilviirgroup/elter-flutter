import 'package:elter/view/constants/colors.dart';
import 'package:flutter/material.dart';

class NewProductLabel extends StatelessWidget {
  const NewProductLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      decoration: const BoxDecoration(
        color: kGreen,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: const Center(
        child: Text(
          "Täze",
          style: TextStyle(
            color: kWhite,
          ),
        ),
      ),
    );
  }
}
