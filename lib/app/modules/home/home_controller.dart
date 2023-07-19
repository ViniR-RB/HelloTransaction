import 'dart:async';

import 'package:hellotransaction/app/core/app_event.dart';
import 'package:hellotransaction/app/modules/home/event.dart';
import 'package:hellotransaction/app/modules/home/states.dart';

import '../../core/app_state.dart';
import 'home_repository.dart';

class HomeController {
  final HomeRepository repository;
  HomeController(this.repository) {
    _inputController.stream.listen(_mapEventToState);
  }

  final StreamController<AppEvent> _inputController =
      StreamController<AppEvent>();
  final StreamController<AppState> _outpuController =
      StreamController<AppState>();

  Sink<AppEvent> get inputController => _inputController.sink;

  Stream<AppState> get stream => _outpuController.stream;

  _mapEventToState(AppEvent event) async {
    if (event is HomeFetchTransactionsEvent) {
      _outpuController.add(HomeStateLoadingGetTransactions());
      final result = await repository.getAllTransactions();
      result.fold(
        (l) => _outpuController.add(
          HomeStateErrorGetTransactions(l.message),
        ),
        (r) {
          _outpuController.add(
            HomeStateLoadedGetTransactions(transactions: r),
          );
        },
      );
    }
  }
}
