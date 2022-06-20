part of 'package:elter/view/pages/product/products_page.dart';

class SizeContainer extends StatelessWidget {
  final Product product;
  const SizeContainer({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Ölçeg:",
            style: boldTextStyle.copyWith(fontSize: 16),
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              product.photo1!,
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.brand!,
                                  style: boldTextStyle,
                                ),
                                Text(
                                  product.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                16,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                10,
                                        decoration: BoxDecoration(
                                          color: textRedColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            product.discountPercentage!
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                  color: kWhite,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          product.price.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                color: textGreyColor,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                        ),
                                        Text(
                                          product.newPrice!.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(
                                                color: kBlack,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Ölçeg",
                          style: boldTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ..._measure.map(
                            (index) => Container(
                              margin: const EdgeInsets.all(2),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: kBlack),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        height: screenSize.height / 10,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kPrimaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "Sebede goş",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: kWhite),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kBlack),
            ),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ölçegiňi saýla:",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Icon(Icons.arrow_downward),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

List _measure = [
  {"measure": "XS"},
  {"measure": "S"},
  {"measure": "M"},
  {"measure": "L"},
  {"measure": "XL"},
];
