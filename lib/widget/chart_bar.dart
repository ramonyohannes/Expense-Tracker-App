import 'package:flutter/material.dart';

class Chart_Bar extends StatelessWidget {
  // const Chart_Bar({Key? key}) : super(key: key);
  final String date;
  final double amount;
  final double spendingpersontil;
  Chart_Bar(
    this.date,
    this.amount,
    this.spendingpersontil,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text(amount.toString()),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingpersontil,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          date.toString(),
        )
      ],
    );
  }
}
