import 'package:bloc/bloc.dart';
import '../../../entity/models/category.dart';
import '../../../entity/repos/category_repository.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;
  CategoryCubit(this.categoryRepository) : super(CategoryInitial());

    void fetchCategories() {
    categoryRepository.fetchData().then((categories) {
      emit(CategoryLoaded(categories: categories));
    });
  }
}
