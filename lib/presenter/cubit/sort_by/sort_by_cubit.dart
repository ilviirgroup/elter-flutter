import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sort_by_state.dart';

class SortByCubit extends Cubit<SortByState> {
  SortByCubit() : super(SortByInitial());

  void sortBy(String sortBy) {
    emit(
      SortByCalled(sortBy),
    );
  }
}
