import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeTabsLengthCubit extends Cubit<int> {
  ChangeTabsLengthCubit() : super(0);

  void changeTabsLenth(int index) {
    emit(index);
  }
}
