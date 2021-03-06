part of 'package:elter/view/pages/product/products_page.dart';

class ColorContainer extends StatelessWidget {
  final Product product;
  const ColorContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text(
                "Reňk: ",
                style: boldTextStyle,
              ),
              Text(
                product.color!,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: textGreyColor),
              ),
            ],
          ),
        ),
        Row(
          children: [
            ..._color.map(
              (e) => Container(
                margin: const EdgeInsets.all(5),
                height: screenSize.height / 10,
                width: screenSize.width / 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: kBlack, width: 2),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

List _color = [
  {
    "color": "0xFF000000",
  },
  {
    "color": "0xFFE21010",
  },
  {
    "color": "0xFF2196F3",
  },
  {
    "color": "0xFF6e6c6c",
  },
];
