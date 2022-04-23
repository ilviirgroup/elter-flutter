part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'App Started';

  @override
  List<Object> get props => [];
}

class AuthenticationInitializedEvent extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final VerificationCode code;

  const LoggedIn(this.code);
}

class LoggedOut extends AuthenticationEvent {
  final String userPhone;

  const LoggedOut(this.userPhone);
}

class UserInfosUpdated extends AuthenticationEvent{
  final User _user;

  const UserInfosUpdated(this._user);

   @override
  List<Object> get props => [_user];
}