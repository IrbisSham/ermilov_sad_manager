import 'authentication/authentication_bloc.dart';

class AuthenticationBlocController {
  AuthenticationBlocController._();
  static final AuthenticationBlocController _instance = AuthenticationBlocController._();
  factory AuthenticationBlocController() => _instance;

  AuthenticationBloc authenticationBloc = AuthenticationBloc();
}
