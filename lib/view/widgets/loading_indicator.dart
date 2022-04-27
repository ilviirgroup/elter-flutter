import '../../utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      color: kScaffoldBackgroundColor,
      height: screenSize.height,
      width: screenSize.width,
      child: const Center(
        child: 
       
        CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
