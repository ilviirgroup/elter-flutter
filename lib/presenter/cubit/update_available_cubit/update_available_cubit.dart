import 'package:bloc/bloc.dart';
import '../../../entity/models/update.dart';
import '../../../entity/repos/update_repository.dart';
import 'package:equatable/equatable.dart';

part 'update_available_state.dart';

class UpdateAvailableCubit extends Cubit<UpdateAvailableState> {
  final UpdateRepository repository;
  UpdateAvailableCubit(this.repository) : super(UpdateAvailableInitial());

  void isUpdateAvailable() {
    repository.fetchData().then((value) {
      emit(UpdateFetchSuccess(isUpdated: value));
    });
  }
}
