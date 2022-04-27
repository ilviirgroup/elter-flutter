import 'package:bloc/bloc.dart';
import '../../../entity/models.dart';
import 'package:equatable/equatable.dart';

part 'temporary_subcategory_object_state.dart';

class TemporarySubcategoryObjectCubit
    extends Cubit<TemporarySubcategoryObjectState> {
  TemporarySubcategoryObjectCubit()
      : super(TemporarySubcategoryObjectInitial());

  void temporarySubCategoryObject(String appBarTitle) {
    emit(
      TemporarySubcategoryObjectLoaded(appBarTitle),
    );
  }
}
