import 'package:elter/view/constants/colors.dart';
import 'package:flutter/material.dart';

class InTheCartLabel extends StatelessWidget {
  const InTheCartLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kPrimaryColor.withOpacity(0.5),
                Colors.orange.withOpacity(0.5),
              ]),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8.0),
              bottomLeft: Radius.circular(50.0))),
      margin: const EdgeInsets.only(top: 2, right: 2),
      width: 20,
      height: 550 / 3,
      child: const RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Sebetde',
          style: TextStyle(
              fontSize: 16, color: kWhite, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
