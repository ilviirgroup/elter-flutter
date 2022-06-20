import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final Color color;
  final String label;
  final Function addToCart;
  const AddToCartButton(
      {Key? key,
      required this.color,
      required this.label,
      required this.addToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          addToCart();
        },
        style: Theme.of(context)
            .elevatedButtonTheme
            .style!
            .copyWith(backgroundColor: MaterialStateProperty.all(color)),
        child: Text(label),
      ),
    );
  }
}
