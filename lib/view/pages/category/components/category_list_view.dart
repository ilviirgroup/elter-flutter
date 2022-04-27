part of 'package:elter/view/pages/category/category_page.dart';

class CategoryListView extends StatelessWidget {
  final String superCategoryName;

  const CategoryListView({Key? key, required this.superCategoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is! CategoryLoaded) {
          return const LoadingIndicator();
        }
        final List<Category> allCategoryList = state.categories;
        final List<Category> categoryList = allCategoryList
            .where((category) => category.superCategory == superCategoryName)
            .toList();
        return Container(
          margin: const EdgeInsets.fromLTRB(10, 8, 10, 2),
          color: kWhite,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: categoryList
                .map(
                  (categoryItem) => CategoryListItem(item: categoryItem),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
