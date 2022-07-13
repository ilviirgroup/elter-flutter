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

  @override
  void initState() {
    imageUrls = collectImages(widget.product);
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
            CustomSlider(imageUrls: imageUrls, imageAspectRatio: 0.85),
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

      bottomSheet: BottomPriceBar(
        product: widget.product,
      ),
    );
  }
}
