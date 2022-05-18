import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

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
    var textInput = TextEditingController();
    var amountInput = TextEditingController();

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Card(
            child: Text("Chart"),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Title',
                    ),
                    controller: textInput,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Amount',
                    ),
                    controller: amountInput,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: RaisedButton(
                    onPressed: () {
                      print(amountInput.text);
                      print(textInput.text);
                    },
                    child: const Text("Add Tx"),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: transactions.map(
              (tx) {
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
                        tx.amount.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      tx.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMEd().format(tx.date),
                    ),
                  ),
                );
              },
            ).toList(),
          )
        ],
      ),
    );
  }
}
