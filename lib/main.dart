import 'package:expense/transaction_input.dart';
import 'package:expense/transaction_list.dart';
import 'package:flutter/material.dart';

import './transaction.dart';

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

  List<Transaction> user_transactions = [
    /*   Transaction(
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

  void addNewTx(String txTitle, String txAmount) {
    setState(
      () {
        user_transactions.add(
          Transaction(
            title: txTitle,
            amount: double.parse(txAmount),
            date: DateTime.now(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense",
          /*  style: TextStyle(
            fontFamily: "Quicksand",
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ), */
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
        /*    centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10, */
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Card(
            child: Text("Chart"),
          ),
          TransactionList(user_transactions)
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
