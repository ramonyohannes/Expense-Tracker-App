import 'package:expense/transaction_input.dart';
import 'package:expense/transaction_list.dart';
import 'package:flutter/material.dart';

import './transaction.dart';
import './widget/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.blue,
        fontFamily: "Quicksand",
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            fontFamily: "QuickSand",
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white10,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: "OpenSans",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // const HomePage({Key? key}) : super(key: key);

  var textInput = TextEditingController();
  var amountInput = TextEditingController();

  List<Transaction> userTransactions = [
    /*  Transaction(
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
    ), */
  ];

  List<Transaction> get recentTransaction {
    return userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void addNewTx(String txTitle, String txAmount, DateTime pickedDate) {
    setState(
      () {
        userTransactions.add(
          Transaction(
            id: DateTime.now().toString(),
            title: txTitle,
            amount: double.parse(txAmount),
            date: pickedDate,
          ),
        );
      },
    );
  }

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (tx) {
        return TransactionInput(addNewTx);
      },
    );
  }

  void deleteTransaction(String id) {
    setState(() {
      userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(recentTransaction);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense",
        ),
        actions: [
          IconButton(
            onPressed: () {
              startAddNewTransaction(context);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chart(recentTransaction),
          TransactionList(userTransactions, deleteTransaction),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startAddNewTransaction(context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
