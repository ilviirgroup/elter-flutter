import 'package:flutter/material.dart';

import '../../../../utils/constants/constants.dart';

class ShowEmptyCart extends StatelessWidget {
  const ShowEmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: Container(
            color: kWhite,
            height: screenSize.height,
            width: screenSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sebediňiz boş!',
                  style: semiBoldTextStyle.copyWith(fontSize: 26),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(AppAssets.emptyCartImage),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
