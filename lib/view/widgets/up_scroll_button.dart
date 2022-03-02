import 'package:elter/view/styles.dart';
import 'package:flutter/material.dart';

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
        ? Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                scrollUp();
                toggleButton();
              },
              child: const CircleAvatar(
                backgroundColor: kBlack,
                foregroundColor: kWhite,
                radius: 20,
                child: Icon(Icons.keyboard_arrow_up),
              ),
            ),
          )
        : const SizedBox();
  }
}
