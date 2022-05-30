import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  var textInput = TextEditingController();
  var amountInput = TextEditingController();
  Function txAdd;
  // const TransactionInput({Key? key}) : super(key: key);
  TransactionInput(this.txAdd);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                txAdd(textInput.text, double.parse(amountInput.text));
                print(amountInput.text);
                print(textInput.text);
              },
              child: const Text("Add Tx"),
            ),
          ),
        ],
      ),
    );
  }
}
