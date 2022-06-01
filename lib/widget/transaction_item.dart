import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  //const Transaction_item({Key? key}) : super(key: key);
  final String id;
  final double amount;
  final String title;
  final DateTime date;
  final Function deletetransaction;

  TransactionItem(
    this.id,
    this.amount,
    this.date,
    this.title,
    this.deletetransaction,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: CircleAvatar(
          maxRadius: 30,
          backgroundColor: Theme.of(context).primaryColor,
          child: Text(
            "\$$amount",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
        trailing: IconButton(
          onPressed: () {
            deletetransaction(id);
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
