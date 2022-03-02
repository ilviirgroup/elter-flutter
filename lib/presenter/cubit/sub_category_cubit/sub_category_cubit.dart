import 'package:bloc/bloc.dart';
import 'package:elter/entity/models/sub_category.dart';
import 'package:elter/entity/repos/subcategory_repository.dart';
import 'package:equatable/equatable.dart';

part 'sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  final SubCategoryRepository repository;
  SubCategoryCubit(this.repository) : super(SubCategoryInitial());

  void fetchSubCategories() {
    repository.fetchData().then((subCategories) {
      emit(SubCategoryLoaded(subCategories: subCategories));
    });
  }

  // void getIndex(int index) {
  //   emit(SubCategoryLoaded(index: index));
  // }
}
