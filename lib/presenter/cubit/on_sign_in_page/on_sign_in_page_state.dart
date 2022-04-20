part of 'on_sign_in_page_cubit.dart';

abstract class OnSignInPageState extends Equatable {
  const OnSignInPageState();

  @override
  List<Object> get props => [];
}

class OnSignInPageInitial extends OnSignInPageState {}

class OnSignInPageLoaded extends OnSignInPageState {
  final Function signInPage;
  const OnSignInPageLoaded(this.signInPage);

  @override
  List<Object> get props => [signInPage];
}
