import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  //const Transaction_item({Key? key}) : super(key: key);
  final double amount;
  final String title;
  final DateTime date;
  TransactionItem(this.amount, this.date, this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.all(
            width: 2,
            color: Colors.blue,
          )),
          child: Text(
            amount.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          DateFormat.yMEd().format(date),
        ),
      ),
    );
  }
}
