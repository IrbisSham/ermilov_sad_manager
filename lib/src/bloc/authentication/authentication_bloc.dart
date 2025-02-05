import 'package:bloc/bloc.dart';
import 'package:ermilov_sad_manager/main.dart';
import 'package:ermilov_sad_manager/src/models/authentication/current_user_data.dart';
import 'package:ermilov_sad_manager/src/models/authentication/token.dart';
import 'package:ermilov_sad_manager/src/models/authentication/user_data.dart';
import 'package:ermilov_sad_manager/src/resources/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

  final AuthenticationRepository authenticationService =
      AuthenticationRepository();
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AppLoadedup>(_mapAppSignUpLoadedState);
    on<UserSignUp>(_mapUserSignupToState);
    on<UserLogin>(_mapUserLoginState);
    on<UserLogOut>((event, emit) async {
      final SharedPreferences sharedPreferences = await prefs;
      sharedPreferences.clear();
      emit(UserLogoutState());
    });
    on<GetUserData>((event, emit) async {
      final SharedPreferences sharedPreferences = await prefs;
      int? currentUserId = sharedPreferences.getInt('userId');
      final data = await authenticationService.getUserData(currentUserId ?? 4);
      final currentUserData = CurrentUserData.fromJson(data);
      emit(SetUserData(currentUserData: currentUserData));
    });
  }

  void _mapAppSignUpLoadedState(
      AppLoadedup event, Emitter<AuthenticationState> emit) async {
    AuthenticationLoading();
    try {
      await Future.delayed(const Duration(milliseconds: 500)); // a simulated delay
      final SharedPreferences sharedPreferences = await prefs;
      if (sharedPreferences.getString('authtoken') != null) {
        emit(AppAutheticated());
      } else {
        emit(AuthenticationStart());
      }
    } catch (e) {
      emit(AuthenticationFailure(
          message: e.toString() ?? 'An unknown error occurred'));
    }
  }

  void _mapUserLoginState(
      UserLogin event, Emitter<AuthenticationState> emit) async {
    final SharedPreferences sharedPreferences = await prefs;
    emit(AuthenticationLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 500)); // a simulated delay
      final data = await authenticationService.loginWithEmailAndPassword(
          event.email, event.password);
      if (data["error"] == null) {
        final currentUser = Token.fromJson(data);
        sharedPreferences.setString('authtoken', currentUser.token);
        emit(AppAutheticated());
            } else {
        emit(AuthenticationFailure(message: data["error"]));
      }
    } catch (e) {
      emit(AuthenticationFailure(
          message: e.toString() ?? 'An unknown error occurred'));
    }
  }

  void _mapUserSignupToState(
      UserSignUp event, Emitter<AuthenticationState> emit) async {
    final SharedPreferences sharedPreferences = await prefs;
    emit(AuthenticationLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 500)); // a simulated delay
      final data = await authenticationService.signUpWithEmailAndPassword(
          event.email, event.password);

      if (data["error"] == null) {
        final currentUser = UserData.fromJson(data);
        sharedPreferences.setString('authtoken', currentUser.token);
        sharedPreferences.setInt('userId', currentUser.id);
        emit(AppAutheticated());
            } else {
        emit(AuthenticationFailure(message: data["error"]));
      }
    } catch (e) {
      emit(AuthenticationFailure(
          message: e.toString() ?? 'An unknown error occurred'));
    }
  }
}
