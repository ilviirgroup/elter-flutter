part of 'verification_bloc.dart';

abstract class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object> get props => [];
}

class VerificationInitial extends VerificationState {}

class VerificationCodeLoadedState extends VerificationState {
  final VerificationCode codeObject;
  const VerificationCodeLoadedState({required this.codeObject});

  @override
  List<Object> get props => [codeObject];
}
