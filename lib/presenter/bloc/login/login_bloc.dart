import 'package:bloc/bloc.dart';
import '../../../entity/models/verification_code.dart';
import '../../../entity/repos/user_repository.dart';
import 'package:equatable/equatable.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _repository;
  LoginBloc(this._repository) : super(LoginInitial()) {
    on<AppStartEvent>(_onAppStartedEvent);
    on<PhoneNumberSentEvent>(_phoneNumberSentEvent);
    on<VerifyOtpEvent>(_onVerifyOtpEvent);
    on<LoginCompletedEvent>(_onLoginCompletedEvent);
    on<LoginExceptionEvent>(_onLoginExceptionEvent);
  }

  void _onAppStartedEvent(AppStartEvent event, Emitter<LoginState> emit) {
    emit(LoginInitial());
  }

  void _phoneNumberSentEvent(
      PhoneNumberSentEvent event, Emitter<LoginState> emit) async {
    final VerificationCode code =
        await _repository.getVerificationCode(event.verificationCode);
    emit(PhoneNumberSentSuccess(code));
  }

  void _onVerifyOtpEvent(VerifyOtpEvent event, Emitter<LoginState> emit) async {
    // final user = await _repository.sigIn(event.code);
    // _repository.persistToken(isUserExist);
    emit(OtpVerifiedState());
  }

  void _onLoginCompletedEvent(
      LoginCompletedEvent event, Emitter<LoginState> emit) {
    emit(const LoginCompleteState());
  }

  void _onLoginExceptionEvent(
      LoginExceptionEvent event, Emitter<LoginState> emit) {
    emit(ExceptionState(message: event.message));
  }
}
