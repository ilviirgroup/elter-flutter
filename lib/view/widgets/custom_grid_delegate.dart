import 'package:flutter/material.dart';

SliverGridDelegate customGridDelegate(int axisCount) {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: axisCount,
    mainAxisSpacing: 5.0,
    crossAxisSpacing: 5.0,
  );
}
