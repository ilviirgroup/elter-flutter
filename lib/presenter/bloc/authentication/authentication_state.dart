part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final String user;
  const Authenticated(this.user);
  @override
  List<Object> get props => [user];
}

class Unauthenticated extends AuthenticationState {}

class LoadingState extends AuthenticationState {}
