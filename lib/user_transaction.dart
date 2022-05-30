import 'package:expense/transaction_input.dart';
import 'package:flutter/material.dart';

import './transaction.dart';

import 'transaction_input.dart';
import 'transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  //const UserTransaction({Key? key}) : super(key: key);
  List<Transaction> transactions = [
    Transaction(
      title: "Food",
      amount: 35.5,
      date: DateTime.now(),
    ),
    Transaction(
      title: "Transport",
      amount: 10.5,
      date: DateTime.now(),
    ),
    Transaction(
      title: "Utility",
      amount: 55.5,
      date: DateTime.now(),
    ),
  ];

  addTx(String txTitle, double txAmount) {
    setState(
      () {
        transactions.add(
          Transaction(
            title: txTitle,
            amount: txAmount,
            date: DateTime.now(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionInput(addTx),
        TransactionList(transactions),
      ],
    );
  }
}
