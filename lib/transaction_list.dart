import 'package:flutter/material.dart';

import './widget/transaction_item.dart';

import 'transaction.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({Key? key}) : super(key: key);
  final List<Transaction> user_transactions;
  TransactionList(this.user_transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      //color: Colors.teal,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return TransactionItem(
            user_transactions[index].amount,
            user_transactions[index].date,
            user_transactions[index].title,
          );
        },
        itemCount: user_transactions.length,
      ),
    );
  }
}
