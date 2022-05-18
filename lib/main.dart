import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Card(
            child: Text("Chart"),
          ),
          Column(
            children: transactions.map(
              (tx) {
                return ListTile(
                  leading: Text(tx.title),
                  title: Text(tx.amount.toString()),
                  subtitle: Text(tx.date.toString()),
                );
              },
            ).toList(),
          )
        ],
      ),
    );
  }
}
