import 'package:bloc/bloc.dart';
import '../../../entity/models.dart';
import '../../../entity/repos/verification_code_repository.dart';
import 'package:equatable/equatable.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final VerificationCodeRepository _repository;
  VerificationBloc(this._repository) : super(VerificationInitial()) {
    on<VerificationCodeFetchedEvent>(_onVerificationCodeFetched);
  }

  void _onVerificationCodeFetched(VerificationCodeFetchedEvent event,
      Emitter<VerificationState> emit) async {
    VerificationCode codeObj = await _repository.fetchData();
    emit(VerificationCodeLoadedState(codeObject: codeObj));
  }
}
