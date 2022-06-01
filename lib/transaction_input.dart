import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

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

  var pickedDate;

  void submitData() {
    final enterdTitle = textInput.text;
    final enteredAmount = double.parse(amountInput.text);

    if (enterdTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.txAdd(
      enterdTitle,
      enteredAmount.toStringAsFixed(1),
      pickedDate,
    );

    Navigator.of(context).pop();
  }

  void startShowDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        pickedDate = value;
      });
    });
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
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                RaisedButton(
                  onPressed: () {
                    startShowDatePicker(context);
                  },
                  child: Text("Pick Date"),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  pickedDate == null
                      ? "No Date Selected"
                      : DateFormat.yMEd().format(pickedDate),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            child: RaisedButton(
              onPressed: () {
                submitData();
              },
              child: const Text("Add Tx"),
            ),
          ),
        ],
      ),
    );
  }
}
