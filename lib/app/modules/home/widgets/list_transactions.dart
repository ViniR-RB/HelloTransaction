import 'package:flutter/material.dart';

import '../../../core/models/transaction.dart';
import 'card_transaction.dart';

class ListTransactions extends StatelessWidget {
  final List<Transaction> transactions;

  const ListTransactions({required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? const Center(
            child: Text(
              'Envie Agora Mesmo Suas Transações',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          )
        : SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: transactions.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CardTransaction(trasaction: transactions[index]);
              },
            ));
  }
}
