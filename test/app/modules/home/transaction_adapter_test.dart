import 'package:flutter_test/flutter_test.dart';
import 'package:hellotransaction/app/modules/home/transaction_adapter.dart';

import '../../../constants/constants.dart';

void main() {
  test('shoud me return Transaction', () {
    final transaction =
        TransactionAdapter.jsonFromTransactionModel(dynamicFromTransaction);

    expect(transaction.id, "1");
    expect(transaction.quantity, 500);
    expect(transaction.brokerage, 0.54);
    expect(transaction.price, 2);
    expect(transaction.operation, "C");
    expect(transaction.createdAt, "2023-07-14T06:01:31.332Z");
    expect(transaction.updatedAt, "2023-07-14T06:01:31.332Z");
  });
}
