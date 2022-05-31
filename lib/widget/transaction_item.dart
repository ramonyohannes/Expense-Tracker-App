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
      elevation: 1,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          child: Text(
            "\$$amount",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        subtitle: Text(
          DateFormat.yMEd().format(date),
        ),
      ),
    );
  }
}
