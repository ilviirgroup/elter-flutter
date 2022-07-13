part of 'package:elter/view/pages/product/products_page.dart';

class ZoomPhoto extends StatefulWidget {
  final String photoUrl;
  final List<String> imageList;
  const ZoomPhoto({Key? key, required this.photoUrl, required this.imageList})
      : super(key: key);

  @override
  State<ZoomPhoto> createState() => _ZoomPhotoState();
}

class _ZoomPhotoState extends State<ZoomPhoto> {
  late List<NetworkImage> networkImages;
  late PageController _pageController;
  late int position;

  @override
  void initState() {
    networkImages = widget.imageList.map((e) => NetworkImage(e)).toList();
    _pageController =
        PageController(initialPage: widget.imageList.indexOf(widget.photoUrl));
    position = widget.imageList.indexOf(widget.photoUrl);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            color: Colors.transparent,
            child: const Icon(Icons.close),
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: screenSize.width,
            height: screenSize.height,
          ),
          SizedBox(
            height: screenSize.height * 0.77,
            child: PhotoViewGallery.builder(
              pageController: _pageController,
              onPageChanged: (page) {
                setState(() {
                  position = page;
                });
              },
              itemCount: widget.imageList.length,
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  heroAttributes: PhotoViewHeroAttributes(tag: widget.photoUrl),
                  imageProvider: networkImages[index],
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 2,
                );
              },
              scrollPhysics: const BouncingScrollPhysics(),
              backgroundDecoration:
                  BoxDecoration(color: Theme.of(context).canvasColor),
            ),
          ),
          Positioned(
              bottom: 20,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: screenSize.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                        widget.imageList.length,
                        (index) => SmallImageContainer(
                              index: index,
                              position: position,
                              imageUrl: widget.imageList[index],
                            )),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class SmallImageContainer extends StatefulWidget {
  const SmallImageContainer(
      {Key? key,
      required this.imageUrl,
      required this.index,
      required this.position})
      : super(key: key);

  final String imageUrl;
  final int index;
  final int position;
  @override
  State<SmallImageContainer> createState() => _SmallImageContainerState();
}

class _SmallImageContainerState extends State<SmallImageContainer> {
  @override
  Widget build(BuildContext context) {
    bool current = widget.index == widget.position;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      width: 55,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(4.5),
        border: Border.all(color: current ? kPrimaryColor : Colors.grey[400]!),
      ),
      child: Image.network(
        widget.imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
