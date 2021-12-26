import 'package:exptracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class chart extends StatelessWidget {
  final List<Transaction> recentTrnx;
  chart(this.recentTrnx);

  List<Map<String, dynamic>> get groupedTrnxValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTrnx.length; i++) {
        if (recentTrnx[i].date.day == weekDay.day &&
            recentTrnx[i].date.month == weekDay.month &&
            recentTrnx[i].date.year == weekDay.year) {
          totalSum += recentTrnx[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get maxSpendings {
    return groupedTrnxValues.fold(0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTrnxValues.map((data) {
            // return chartBar(data['day'],data['amount'],data['amount']/totalSum);
            return Flexible(
              fit: FlexFit.tight,
              child: chartBar(
                data['day'],
                data['amount'],
                maxSpendings == 0
                    ? 0
                    : (data['amount'] as double) / maxSpendings,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
