import 'package:elter/view/styles.dart';
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
      decoration: BoxDecoration(
        color: newProductLabelColor,
        borderRadius: const BorderRadius.only(
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
