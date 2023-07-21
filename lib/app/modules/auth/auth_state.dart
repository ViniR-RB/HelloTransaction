// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hellotransaction/app/core/app_state.dart';

class AuthStateInitial extends AppState {}

class AuthStateClickButtonLogin extends AuthStateInitial {
  final String email;
  final String password;
  AuthStateClickButtonLogin({
    required this.email,
    required this.password,
  });
}

class AuthStateLoginLoading extends AuthStateInitial {}

class AuthStateLoginLoaded extends AuthStateInitial {}

class AuthStateLoginError extends AuthStateInitial {
  final String message;
  AuthStateLoginError(this.message);
}
