part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent([List props = const []]);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'App Started';

  @override
  List<Object> get props => [];
}

class LoggedIn extends AuthenticationEvent {
  final String token;

  LoggedIn({required this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn { token: $token}';

  @override
  List<Object> get props => [token];
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';

  @override
  List<Object?> get props => throw UnimplementedError();
}

class UserSaved extends AuthenticationEvent {
  final Map<String, dynamic> obj;
  const UserSaved({required this.obj});
  @override
  String toString() => 'User was saved';

  @override
  List<Object?> get props => [obj];
}
