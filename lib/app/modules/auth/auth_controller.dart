import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hellotransaction/app/modules/auth/auth_repository.dart';

import '../../core/app_event.dart';
import '../../core/app_state.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthController {
  final AuthRepository _repository;
  AuthController(this._repository) {
    _inputController.stream.listen(_mapEventToState);
  }

  final StreamController<AppEvent> _inputController =
      StreamController<AppEvent>();
  final StreamController<AppState> _outpuController =
      StreamController<AppState>();

  Sink<AppEvent> get inputController => _inputController.sink;

  Stream<AppState> get stream => _outpuController.stream;

  _mapEventToState(AppEvent event) async {
    if (event is AuthLoginEvent) {
      _outpuController.add(AuthStateLoginLoading());
      final result = await _repository.login(event.email, event.password);
      result.fold(
        (l) {
          _outpuController.add(
            AuthStateLoginError(l.message),
          );
        },
        (r) {
          _outpuController.add(
            AuthStateLoginLoaded(),
          );
          Future.delayed(const Duration(seconds: 2));
          Modular.to.navigate('/home/');
        },
      );
    }
  }
}
