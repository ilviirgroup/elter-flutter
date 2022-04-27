part of 'package:elter/view/pages/cart/cart_screen.dart';

class ChangeQuantity extends StatefulWidget {
  final Product product;
  const ChangeQuantity({Key? key, required this.product}) : super(key: key);

  @override
  State<ChangeQuantity> createState() => _ChangeQuantityState();
}

class _ChangeQuantityState extends State<ChangeQuantity> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        changeQuantityButton(context, false),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: Text(
            widget.product.selectedQuantity.toString(),
            style: semiBoldTextStyle.copyWith(fontSize: 18),
          ),
        ),
        changeQuantityButton(context, true)
      ],
    );
  }

  static const BorderRadius _borderRadius =
      BorderRadius.all(Radius.circular(5.0));
  final Border _border = Border.all(color: kPrimaryColor);

  InkWell changeQuantityButton(BuildContext context, bool isIncrement) {
    return InkWell(
      onTap: () {
        setState(() {
          context.read<CartBloc>().add(
                CartUpdatedEvent(
                  widget.product.productId,
                  widget.product.name,
                  isIncrement,
                ),
              );
        });
      },
      child: isIncrement
          ? Container(
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.8),
                border: _border,
                borderRadius: _borderRadius,
              ),
              child: const Icon(
                Icons.add,
                color: kWhite,
              ),
            )
          : Container(
              decoration: BoxDecoration(
                border: _border,
                borderRadius: _borderRadius,
              ),
              child: const Icon(
                Icons.remove,
                color: kPrimaryColor,
              ),
            ),
    );
  }
}
