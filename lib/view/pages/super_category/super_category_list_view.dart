part of 'super_category_page.dart';

class SuperCategoryListView extends StatelessWidget {
  const SuperCategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperCategoryCubit, SuperCategoryState>(
      builder: (context, state) {
        if (state is! SuperCategoryLoaded) {
          return const LoadingIndicator();
        }
        final List<SuperCategory> superCategoryList = state.superCategories;
        return Scrollbar(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final superCat = superCategoryList[index];
              return SuperCategoryListItem(superCat: superCat);
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 2.0,
                  color: whiteGrey,
                ),
              );
            },
            itemCount: superCategoryList.length,
          ),
        );
      },
    );
  }
}
