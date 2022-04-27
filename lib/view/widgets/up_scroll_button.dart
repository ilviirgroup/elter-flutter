import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';

class UpScrollButton extends StatelessWidget {
  final Function scrollUp;
  final Function toggleButton;
  final bool showButton;
  const UpScrollButton(
      {Key? key,
      required this.scrollUp,
      required this.toggleButton,
      required this.showButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showButton
        ? GestureDetector(
            onTap: () {
              scrollUp();
              toggleButton();
            },
            child: CircleAvatar(
              backgroundColor: kBlack.withOpacity(0.9),
              foregroundColor: kWhite,
              radius: 20,
              child: const Icon(Icons.keyboard_arrow_up),
            ),
          )
        : const SizedBox();
  }
}
