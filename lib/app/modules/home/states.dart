import 'package:hellotransaction/app/core/app_state.dart';
import 'package:hellotransaction/app/core/models/transaction.dart';

class HomeStateInitial extends AppState {}

class HomeStateLoadingGetTransactions extends AppState {}

class HomeStateLoadedGetTransactions extends AppState {
  final List<Transaction> transactions;

  HomeStateLoadedGetTransactions({required this.transactions});
}

class HomeStateErrorGetTransactions extends AppState {
  final String message;
  HomeStateErrorGetTransactions(this.message);
}
