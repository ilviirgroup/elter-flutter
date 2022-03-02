part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class OtpSentState extends LoginState {
  final VerificationCode userVerified;
  const OtpSentState({required this.userVerified});
  @override
  List<Object> get props => [userVerified];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class OtpVerifiedState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginCompleteState extends LoginState {
  // final FirebaseAuth? firebaseUser;

  const LoginCompleteState();

  // FirebaseAuth getUser() {
  //   return firebaseUser!;
  // }

  @override
  List<Object> get props => [];
}

class ExceptionState extends LoginState {
  final String? message;

  const ExceptionState({this.message});

  @override
  List<Object> get props => [message!];
}

class OtpExceptionState extends LoginState {
  final String? message;

  const OtpExceptionState({this.message});

  @override
  List<Object> get props => [message!];
}

class UserFetchSucess extends LoginState {
  final List? users;
  const UserFetchSucess({this.users});

  @override
  List<Object> get props => [];
}
