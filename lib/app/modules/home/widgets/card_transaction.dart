import 'package:flutter/material.dart';
import 'package:hellotransaction/app/core/models/transaction.dart';
import 'package:timeago/timeago.dart' as timeago;

class CardTransaction extends StatelessWidget {
  final Transaction trasaction;

  const CardTransaction({super.key, required this.trasaction});
  String formatMoneyWithPoint(double input) {
    RegExp regex = RegExp(r'^\d+');
    Match match = regex.firstMatch(input.toString())!;
    return match.group(0)!;
  }

  String formatMoneyWithoutPoint(double input) {
    RegExp regex = RegExp(r'\.(\d+)$');
    Match match = regex.firstMatch(input.toString())!;
    return match.group(1)!;
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(trasaction.createdAt!);
    Size size = MediaQuery.of(context).size;
    final double priceTotal = trasaction.price * trasaction.quantity;

    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 8.0,
        top: 16,
        bottom: 12,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Text(trasaction.id),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: 'Paypal\n'),
                    TextSpan(
                      text: timeago.format(date),
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: size.width / 2.6,
          ),
          RichText(
            text: TextSpan(
                children: [
                  TextSpan(text: formatMoneyWithPoint(priceTotal)),
                  TextSpan(
                    text: '.${formatMoneyWithoutPoint(priceTotal)}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
                style: TextStyle(
                    color:
                        trasaction.operation == 'C' ? Colors.green : Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
