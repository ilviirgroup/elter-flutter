part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable{
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationInitializeHiveBoxState extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User user;
  const Authenticated(this.user);
  @override
  List<Object> get props => [user];
}

class Unauthenticated extends AuthenticationState {}

class LoadingState extends AuthenticationState {}
