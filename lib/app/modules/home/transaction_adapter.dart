import 'package:hellotransaction/app/core/models/transaction.dart';

class TransactionAdapter {
  TransactionAdapter._();
  static Transaction jsonFromTransactionModel(dynamic data) {
    return Transaction(
      id: data['id'].toString(),
      quantity: data['quantity'],
      brokerage: data['brokerage'],
      price: double.parse(data['princeUnit']),
      taxB3: double.parse(data['taxB3']),
      operation: data['operation'],
      createdAt: data['createdAt'] ?? DateTime.now().toIso8601String(),
      updatedAt: data['updatedAt'] ?? DateTime.now().toIso8601String(),
    );
  }
}
