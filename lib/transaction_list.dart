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
      child: user_transactions.isEmpty
          ? Center(
              child: Column(
                children: [
                  Text(
                    "No Transactions added yet!",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 300,
                    margin: EdgeInsets.all(15),
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
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
