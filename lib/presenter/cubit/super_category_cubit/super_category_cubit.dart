import 'package:bloc/bloc.dart';
import 'package:elter/entity/models/super_category.dart';
import 'package:elter/entity/repos/super_category_repository.dart';
import 'package:equatable/equatable.dart';

part 'super_category_state.dart';

class SuperCategoryCubit extends Cubit<SuperCategoryState> {
  final SuperCategoryRepository superCategoryRepository;
  SuperCategoryCubit(this.superCategoryRepository)
      : super(SuperCategoryInitial());

  void fetchSuperCategories() {
    superCategoryRepository.fetchData().then((superCategories) {
      emit(SuperCategoryLoaded(superCategories: superCategories));
    });
  }
}
