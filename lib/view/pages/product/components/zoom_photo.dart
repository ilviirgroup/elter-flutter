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

  @override
  void initState() {
    networkImages = widget.imageList.map((e) => NetworkImage(e)).toList();
    _pageController =
        PageController(initialPage: widget.imageList.indexOf(widget.photoUrl));
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
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
      body: PhotoViewGallery.builder(
        pageController: _pageController,
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
    );
  }
}
