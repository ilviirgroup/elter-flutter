part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class AppStartEvent extends LoginEvent {}

class OtpSendEvent extends LoginEvent {
  final Map<String, dynamic> obj;
  final int id;
  OtpSendEvent({required this.obj, required this.id});
}

class VerifyOtpEvent extends LoginEvent {
  final String? otp;

  VerifyOtpEvent({this.otp});
}

class LoginCompleteEvent extends LoginEvent {
  // final FirebaseAuth? firebaseUser;
  LoginCompleteEvent();
}

class LogoutEvent extends LoginEvent {}

class LoginExceptionEvent extends LoginEvent {
  final String? message;

  LoginExceptionEvent({this.message});
}

class UsersFetchedEvent extends LoginEvent {}
