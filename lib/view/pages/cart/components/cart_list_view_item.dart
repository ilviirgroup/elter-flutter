part of 'package:elter/view/pages/cart/cart_screen.dart';

class CartListViewItem extends StatefulWidget {
  final Product product;
  const CartListViewItem({Key? key, required this.product}) : super(key: key);

  @override
  State<CartListViewItem> createState() => _CartListViewItemState();
}

class _CartListViewItemState extends State<CartListViewItem> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return BlocBuilder<OnProductDetailPageCubit, OnProductDetailPageState>(
      builder: (context, state) {
        final toProductDetailPage = (state as OnProductDetailPageLoaded).onNext;
        return SizedBox(
          height: _size.height * 0.2,
          child: Card(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            elevation: 0.0,
            color: kWhite,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      toProductDetailPage(widget.product);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(widget.product.photo1!),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: GestureDetector(
                                onTap: () {
                                  toProductDetailPage(widget.product);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.product.brand!,
                                        style: boldTextStyle),
                                    Text(
                                      widget.product.name,
                                      style:
                                          const TextStyle(color: textGreyColor),
                                    ),
                                    widget.product.size == 'Standart'
                                        ? const Text('Reňksiz/Standart')
                                        : Text(widget.product.size!),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AppAlertDialog(
                                              content:
                                                  'Harydy sebetden aýyrmakçymy?',
                                              alertType: AlertTypes.warning,
                                              callBack: () {
                                                context.read<CartBloc>().add(
                                                      CartRemovedEvent(
                                                          widget.product
                                                              .productId,
                                                          widget.product.name),
                                                    );
                                              },
                                            ));
                                  },
                                  child: const Icon(
                                    Icons.delete_outlined,
                                    color: textGreyColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ChangeQuantity(product: widget.product),
                              widget.product.isSale
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          modifyPrice(
                                            (widget.product.newPrice! *
                                                widget
                                                    .product.selectedQuantity!),
                                          ),
                                          style: discountedPriceStyle,
                                        ),
                                        Text(
                                          modifyPrice(
                                            (widget.product.price *
                                                widget
                                                    .product.selectedQuantity!),
                                          ),
                                          style: oldPriceStyle,
                                        ),
                                      ],
                                    )
                                  : Text(
                                      modifyPrice(
                                        (widget.product.newPrice! *
                                            widget.product.selectedQuantity!),
                                      ),
                                      style: priceStyle,
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void myDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text(
                'Siz harydy sebetden aýyrmakçymy?',
                style: semiBoldTextStyle,
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    context.read<CartBloc>().add(CartRemovedEvent(
                        widget.product.productId, widget.product.name));
                    Navigator.pop(context);
                  },
                  child: Text(
                    'HAWA',
                    style: boldTextStyle.copyWith(color: Colors.orange),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 10.0, 10.0, 10.0),
                    child: Text(
                      'Ýok',
                      style: semiBoldTextStyle,
                    ),
                  ),
                )
              ],
            ));
  }
}
