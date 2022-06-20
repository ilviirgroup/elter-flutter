part of 'package:elter/view/pages/product/products_page.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<String> imageUrls = [];
  late CarouselController _carouselController;

  @override
  void initState() {
    imageUrls = collectImages(widget.product);
    _carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.5,
              child: CarouselSlider(
                carouselController: _carouselController,
                items: imageUrls
                    .map((e) => GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ZoomPhoto(
                                photoUrl: e,
                                imageList: imageUrls,
                              ),
                            ),
                          ),
                          child: HeroWidget(
                            height: screenSize.height * 0.5,
                            width: screenSize.width,
                            imageUrl: e,
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  height: screenSize.height * 0.5,
                ),
              ),
            ),
            Container(
              width: screenSize.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.product.brand!,
                      style: boldTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                    child: Text(
                      widget.product.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: textGreyColor),
                    ),
                  ),
                  widget.product.color! != 'Standart'
                      ? ColorContainer(product: widget.product)
                      : const SizedBox(),
                  widget.product.size! != 'Standart'
                      ? SizeContainer(product: widget.product)
                      : const SizedBox(),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kWhite,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      "Satyjy: ",
                      style: semiBoldTextStyle.copyWith(fontSize: 16),
                    ),
                    Text(widget.product.vendorName,
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
            ),
            Container(
              width: screenSize.width,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Haryt barada:',
                      style: semiBoldTextStyle.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(widget.product.description!),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ExpansionTile(
                title: const Text("Eltip bermek hyzmaty"),
                textColor: kBlack,
                iconColor: kBlack,
                backgroundColor: kWhite,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text(
                            "Eltip bermek hyzmaty",
                            style: boldTextStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text(
                              """•Eltip bermek hyzmatynyň tölegi harydyňyza görä. Häzirlikçe sagatda 40 km tizlik bilen hereket edýän elektro skooterimiz bar şonuň bilen nesip bolsa halkymyza hezil bereris!!!"""),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),

// bottomsheet

      bottomSheet: Container(
        padding: const EdgeInsets.all(10),
        color: kWhite,
        height: 70.0,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget.product.isSale ? saleParcentage(context) : const SizedBox(),
            widget.product.isSale
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          modifyPrice(widget.product.price),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: textGreyColor,
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                        Text(
                          modifyPrice(widget.product.newPrice!),
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: kBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      modifyPrice(widget.product.newPrice!),
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: kBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
            Expanded(
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoadedState) {
                    Product? isAddedToCart;
                    for (var item in state.cartItems) {
                      if (item.productId == widget.product.productId &&
                          item.name == widget.product.name) {
                        isAddedToCart = item;
                      }
                    }
                    return isAddedToCart != null
                        ? BlocBuilder<OnCartPageCubit, OnCartPageState>(
                            builder: (context, state) {
                              return SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    (state as OnCartPageLoaded).cartPage();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: kWhite,
                                      side: const BorderSide(
                                          width: 2, color: kPrimaryColor)),
                                  child: const Text('Haryt sebetde',
                                      style: TextStyle(color: kPrimaryColor)),
                                ),
                              );
                            },
                          )
                        : buttonAddingToCart(context);
                  }
                  return buttonAddingToCart(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container saleParcentage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        color: textRedColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        '%${widget.product.discountPercentage!.ceil().toString()}',
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: kWhite,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }

  AddToCartButton buttonAddingToCart(BuildContext context) {
    return AddToCartButton(
      color: kPrimaryColor,
      label: 'Sebede goş',
      addToCart: () {
        context
            .read<CartBloc>()
            .add(CartAddedEvent(widget.product..selectedQuantity = 1));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sebede goşuldy'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 70),
          ),
        );
      },
    );
  }
}
