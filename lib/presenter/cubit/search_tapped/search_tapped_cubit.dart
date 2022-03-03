import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_tapped_state.dart';

class SearchTappedCubit extends Cubit<bool> {
  SearchTappedCubit() : super(false);

  void toogleSearchEvent(bool searchTapped) {
    emit(searchTapped);
  }
}
