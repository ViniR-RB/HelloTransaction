import '../../core/app_event.dart';

class AuthLoginEvent extends AppEvent {
  final String email;
  final String password;
  AuthLoginEvent({required this.email, required this.password});
}
