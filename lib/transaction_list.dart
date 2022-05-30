import 'package:flutter/material.dart';

import './widget/transaction_item.dart';

import 'transaction.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({Key? key}) : super(key: key);
  final List<Transaction> user_transactions;
  TransactionList(this.user_transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: user_transactions.map(
        (tx) {
          return TransactionItem(tx.amount, tx.date, tx.title);
        },
      ).toList(),
    );
  }
}
