import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_catalog_screens_state.dart';

class ChangeCatalogScreensCubit extends Cubit<int> {
  ChangeCatalogScreensCubit() : super(0);

  void changeCatalogScreen(int index) {
    emit(index);
  }
}
