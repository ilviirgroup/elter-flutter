part of 'package:elter/view/pages/product/products_page.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({
    Key? key,
    this.products,
  }) : super(key: key);

  final List<Product>? products;

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  bool showButton = false;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scrollbar(
          notificationPredicate: (notification) {
            if (_scrollController.position.userScrollDirection ==
                ScrollDirection.forward) {
              toggleButton(context, true);
            } else if (_scrollController.position.userScrollDirection ==
                ScrollDirection.reverse) {
              toggleButton(context, false);
            }
            return true;
          },
          radius: const Radius.circular(20),
          controller: _scrollController,
          child: GridView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(5),
            scrollDirection: Axis.vertical,
            itemCount: widget.products!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 280,
            ),
            itemBuilder: (BuildContext context, int index) {
              final product = widget.products![index];
              return ProductGridViewItem(
                product: product,
              );
            },
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: UpScrollButton(
            scrollUp: scrollUp,
            toggleButton: toggleButton,
            showButton: showButton,
          ),
        ),
      ],
    );
  }

  void scrollUp() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  void toggleButton(BuildContext ctx, [bool? show]) {
    setState(() {
      FocusScope.of(ctx).unfocus();
      showButton = show ?? !showButton;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
