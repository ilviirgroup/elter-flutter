import 'package:flutter/material.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    Key? key,
    required Size size,
    required this.title,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      alignment: Alignment.center,
      width: _size.width * 0.8,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
