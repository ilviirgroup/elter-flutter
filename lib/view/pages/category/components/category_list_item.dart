part of 'package:elter/view/pages/category/category_page.dart';

class CategoryListItem extends StatelessWidget {
  final Category item;
  const CategoryListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubCategoryPage(categoryObject: item,),
        ),
      ),
      child: Container(
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
      ),
    );
  }
}
