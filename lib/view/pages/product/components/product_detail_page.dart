import 'package:elter/entity/models.dart';
import 'package:elter/view/pages/product/components/color_container.dart';
import 'package:elter/view/pages/product/components/label_new_product.dart';
import 'package:elter/view/pages/product/components/size_container.dart';
import 'package:elter/view/styles.dart';

import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int san = 0;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: _size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.product.photo1!,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                widget.product.isNew!
                    ? const Positioned(
                        top: 12,
                        right: 1,
                        child: NewProductLabel(),
                      )
                    : const SizedBox(),
              ],
            ),
            Container(
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
                      style: productDetail,
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
                  const Divider(
                    indent: 8,
                    endIndent: 15,
                    thickness: 2,
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
                      style: productDetail.copyWith(fontSize: 17),
                    ),
                    Text(
                      widget.product.vendorName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ExpansionTile(
                textColor: kBlack,
                iconColor: kBlack,
                backgroundColor: kWhite,
                title: const Text("Haryt barada"),
                children: [
                  ProductDetailRow(
                    widget: widget,
                    title: "Ady: ",
                    trailing: 'name',
                  ),
                  ProductDetailRow(
                    widget: widget,
                    title: "Harydyn hili:",
                    trailing: "quality",
                  ),
                  ProductDetailRow(
                    widget: widget,
                    title: "Düzümi: ",
                    trailing: "composition",
                  )
                ],
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Eltip bermek hyzmaty",
                            style: productDetail,
                          ),
                        ),
                        const Padding(
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
            )
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
            widget.product.newPrice != null
                ? Container(
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
                  )
                : const SizedBox(),
            widget.product.newPrice != null
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.product.price.toString() + ' TMT',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: textGreyColor,
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                        Text(
                          widget.product.newPrice.toString() + ' TMT',
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
                      widget.product.price.toString() + ' TMT',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: kBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(minimumSize: const Size(0, 50)),
                child: const Text('Sebede goş'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailRow extends StatelessWidget {
  const ProductDetailRow({
    Key? key,
    required this.widget,
    required this.title,
    required this.trailing,
  }) : super(key: key);

  final ProductDetailPage widget;
  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            trailing,
            style: productDetail,
          ),
        ],
      ),
    );
  }
}

//in asakkyny color bermek ucin ulanjak boldum emma ulanyp bilmedim

