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
    return BlocBuilder<OnProductDetailPageCubit, OnProductDetailPageState>(
      builder: (context, state) {
        final toProductDetailPage = (state as OnProductDetailPageLoaded).onNext;
        return SizedBox(
          height: 200,
          child: Card(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            elevation: 0.0,
            color: kWhite,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
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
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 6,
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
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: textGreyColor,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                    widget.product.size == 'Standart'
                                        ? const Text('Re??ksiz/Standart')
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
                                                  'Harydy sebetden a??yrmak??ymy?',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ChangeQuantity(product: widget.product),
                            widget.product.isSale
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        modifyPrice(
                                          (widget.product.newPrice! *
                                              widget.product.selectedQuantity!),
                                        ),
                                        style: discountedPriceStyle,
                                      ),
                                      Text(
                                        modifyPrice(
                                          (widget.product.price *
                                              widget.product.selectedQuantity!),
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
}
