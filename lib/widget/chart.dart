import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transaction.dart';
import 'chart_bar.dart';

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

      return {
        "date": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    });
  }

  double get totalSSpending {
    return userrecentTransaction.fold(0.00, (sum, item) {
      return sum + item.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransaction);
    return Container(
      margin: EdgeInsets.all(15),
      child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...groupedTransaction.map((data) {
                  return Flexible(
                    fit: FlexFit.tight,
                    child: Chart_Bar(
                      "${data["date"]}",
                      data["amount"] as double,
                      totalSSpending == 0.0
                          ? 0.0
                          : (data["amount"] as double) / totalSSpending,
                    ),
                  );
                  //Text("${data["date"]} : ${data["amount"]}");
                }).toList(),
              ],
            ),
          )),
    );
  }
}
