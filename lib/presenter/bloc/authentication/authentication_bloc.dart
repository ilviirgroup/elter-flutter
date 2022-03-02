import 'package:bloc/bloc.dart';
import 'package:elter/entity/models/user.dart';
import 'package:elter/entity/repos/user_repository.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  AuthenticationBloc({required this.userRepository})
      : super(AuthenticationInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
    on<UserSaved>(_onUserSaved);
  }

  void _onAppStarted(
      AppStarted event, Emitter<AuthenticationState> emit) async {
    final String? hasToken = await userRepository.getUser();
    if (hasToken == null) {
      emit(Unauthenticated());
    } else {
      emit(Authenticated(hasToken));
    }
  }

  Future<void> _onLoggedIn(
      LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(LoadingState());
    await userRepository.persistToken(event.token);
    emit(Authenticated(event.token));
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(LoadingState());
    await userRepository.deleteToken();
    emit(Unauthenticated());
  }

  Future<void> _onUserSaved(
      UserSaved event, Emitter<AuthenticationState> emit) async {
    final User currentUser = await userRepository.saveUser(event.obj);
    await userRepository.persistToken(currentUser.phoneNumber);
    emit(Authenticated(currentUser.phoneNumber));
  }
}
