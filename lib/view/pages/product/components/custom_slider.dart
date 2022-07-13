import 'package:flutter/material.dart';

import '../../../widgets/dot_for_slider.dart';
import '../products_page.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider(
      {Key? key, required this.imageUrls, required this.imageAspectRatio})
      : super(key: key);

  final List<String> imageUrls;
  final double imageAspectRatio;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late PageController _pageController;
  int page = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AspectRatio(
        aspectRatio: widget.imageAspectRatio,
        child: Stack(
          children: [
            PageView.builder(
                controller: _pageController,
                itemCount: widget.imageUrls.length,
                onPageChanged: (position) {
                  setState(() {
                    page = position;
                  });
                },
                itemBuilder: (context, index) {
                  String imageUrl = widget.imageUrls[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomPhoto(
                          photoUrl: imageUrl,
                          imageList: widget.imageUrls,
                        ),
                      ),
                    ),
                    child: Hero(
                      tag: imageUrl,
                      child: Image.network(imageUrl),
                    ),
                  );
                }),
            Positioned(
              bottom: 10,
              child: SizedBox(
                width: screenSize.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    widget.imageUrls.length,
                    (index) => DotForSlider(index: index, page: page),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
