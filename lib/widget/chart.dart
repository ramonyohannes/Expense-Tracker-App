import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transaction.dart';

class Chart extends StatelessWidget {
  // const Chart({Key? key}) : super(key: key);
  final List<Transaction> userrecentTransaction;
  Chart(this.userrecentTransaction);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < userrecentTransaction.length; i++) {
        if (userrecentTransaction[i].date.day == weekDay.day &&
            userrecentTransaction[i].date.month == weekDay.month &&
            userrecentTransaction[i].date.year == weekDay.year) {
          totalSum += userrecentTransaction[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum.toString());
      //return {"date": "mon", "amount": "10"};
      return {"date": DateFormat.E().format(weekDay), "amount": totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransaction);
    return Card(
      child: Text("data"),
    );
  }
}
