part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class AppStartEvent extends LoginEvent {}

class PhoneNumberSentEvent extends LoginEvent {
  final VerificationCode verificationCode;

  const PhoneNumberSentEvent(this.verificationCode);

  @override
  List<Object?> get props => [verificationCode];
}

class VerifyOtpEvent extends LoginEvent {
  // final VerificationCode code;

  // VerifyOtpEvent({ required this.code});

  // @override
  // List<Object?> get props => [];
}

class LoginCompletedEvent extends LoginEvent {
  const LoginCompletedEvent();
}

class LogoutEvent extends LoginEvent {}

class LoginExceptionEvent extends LoginEvent {
  final String? message;

  const LoginExceptionEvent({this.message});
}
