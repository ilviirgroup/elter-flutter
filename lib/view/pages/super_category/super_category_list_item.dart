part of 'super_category_page.dart';

class SuperCategoryListItem extends StatelessWidget {
  const SuperCategoryListItem({
    Key? key,
    required this.superCat,
  }) : super(key: key);

  final SuperCategory superCat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(
            superCategoryObject: superCat,
          ),
        ),
      ),
      leading: CircleAvatar(
        radius: 30.0,
        backgroundColor: whiteGrey,
        backgroundImage: NetworkImage(superCat.photo),
      ),
      title: Text(
        superCat.name,
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        color: kBlack,
      ),
    );
  }
}
