import 'package:elter/entity/models.dart';
import 'package:elter/view/styles.dart';
import 'package:flutter/material.dart';

class CategoryListViewItem extends StatelessWidget {
  final Category item;
  const CategoryListViewItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: kScaffoldBackgroundColor, width: 2),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.name),
          const Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }
}
