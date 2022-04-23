import 'package:bloc/bloc.dart';
import 'package:elter/entity/models/user.dart';
import 'package:elter/entity/models/verification_code.dart';
import 'package:elter/entity/repos/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  AuthenticationBloc({required this.userRepository})
      : super(AuthenticationInitializeHiveBoxState()) {
    on<AuthenticationInitializedEvent>(_onAuthenticationInitialized);
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
    on<UserInfosUpdated>(_onUserInfosUpdated);
    // on<UserSaved>(_onUserSaved);
  }

  void _onAuthenticationInitialized(AuthenticationInitializedEvent event,
      Emitter<AuthenticationState> emit) async {
    await userRepository.init();
    emit(AuthenticationInitial());
    add(AppStarted());
  }

  void _onAppStarted(
      AppStarted event, Emitter<AuthenticationState> emit) async {
    List users = userRepository.getUser();
    if (users.isEmpty) {
      emit(Unauthenticated());
    } else {
      emit(Authenticated(users.first));
    }
  }

  Future<void> _onLoggedIn(
      LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(LoadingState());
    final signedUser = await userRepository.sigIn(event.code);
    emit(Authenticated(signedUser));
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(LoadingState());
    await userRepository.deleteToken(event.userPhone);
    emit(Unauthenticated());
  }

  Future<void> _onUserInfosUpdated(
      UserInfosUpdated event, Emitter<AuthenticationState> emit) async {
    await userRepository.updateUserInfos(event._user);
    add(AppStarted());
  }

  // Future<void> _onUserSaved(
  //     UserSaved event, Emitter<AuthenticationState> emit) async {
  //   final User currentUser = await userRepository.registerUser(event.obj);
  //   await userRepository.persistToken(currentUser.phoneNumber);
  //   emit(Authenticated(currentUser.phoneNumber));
  // }
}
