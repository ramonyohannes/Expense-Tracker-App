import 'package:flutter/material.dart';

class TransactionInput extends StatefulWidget {
  Function txAdd;
  // const TransactionInput({Key? key}) : super(key: key);
  TransactionInput(this.txAdd);

  @override
  State<TransactionInput> createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  var textInput = TextEditingController();
  var amountInput = TextEditingController();

  void submitData() {
    final enterdTitle = textInput.text;
    final enteredAmount = double.parse(amountInput.text);

    if (enterdTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.txAdd(
      enterdTitle,
      enteredAmount.toStringAsFixed(1),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 50,
        left: 10,
        right: 10,
        bottom: 10,
      ),
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
              onSubmitted: (_) => submitData(),
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
              onSubmitted: (_) => submitData(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            child: RaisedButton(
              onPressed: () {
                submitData();

                /* print(amountInput.text);
                print(textInput.text); */
              },
              child: const Text("Add Tx"),
            ),
          ),
        ],
      ),
    );
  }
}
