import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';

class AppAlertDialog extends StatelessWidget {
  final String content;
  final AlertTypes alertType;
  final Function? callBack;
  const AppAlertDialog({
    Key? key,
    required this.content,
    required this.alertType,
    this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: kWhite.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: changeAlertIcon(alertType),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(content),
          const SizedBox(
            height: 20,
          ),
          alertType == AlertTypes.warning
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          callBack!();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Hawa',
                          style: semiBoldTextStyle,
                        )),
                    alertActionsItem(context, 'Ýok'),
                  ],
                )
              : alertActionsItem(context, 'OK'),
        ],
      ),
    );
  }

  InkWell alertActionsItem(
    BuildContext context,
    String text,
  ) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        Navigator.pop(context);
      },
      child: Text(
        text,
        style: semiBoldTextStyle.copyWith(color: textGreyColor),
      ),
    );
  }

  changeAlertIcon(AlertTypes alertType) {
    switch (alertType) {
      case AlertTypes.warning:
        return const Icon(
          Icons.error_outline,
          size: 36,
          color: textRedColor,
        );
      case AlertTypes.info:
        return const Icon(
          Icons.info_outline,
          size: 36,
          color: textGreyColor,
        );
      default:
        return const Icon(
          Icons.check_circle_outline,
          size: 36,
          color: kGreen,
        );
    }
  }
}
