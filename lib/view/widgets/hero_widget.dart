import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({
    Key? key,
    required double height,
    required double width,
    required String imageUrl,
  })  : _height = height,
        _width = width,
        _imageUrl = imageUrl,
        super(key: key);

  final double _height;
  final double _width;
  final String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _imageUrl,
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              _imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
