import 'package:exptracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class chart extends StatelessWidget {

  final List<Transaction> recentTrnx;
  chart(this.recentTrnx);

    List<Map<String,Object>> get groupedTrnxValues{
      return List.generate(7, (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = 0.0;
        for(var i=0; i < recentTrnx.length; i++){
        if(recentTrnx[i].date.day == weekDay.day &&
            recentTrnx[i].date.month == weekDay.month &&
            recentTrnx[i].date.year == weekDay.year
        );
        totalSum += recentTrnx[i].amount;
        }

        return {
          'day':DateFormat.E().format(weekDay).substring(0,1),
          'amount':totalSum
        };
      } );
    }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTrnxValues.map((data){
          return Text('${data['day']} , ${data['amount']}');
      }
      ).toList(),
      ),


    );
  }
}
