import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class chartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPerTotal;

  chartBar(this.label, this.spendingAmount, this.spendingPerTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
    Container(
      height: 20,
      child: FittedBox(
        child:  Text(
          '${spendingAmount.toStringAsFixed(0)}',
          ),
      ),
    ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 75,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPerTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    //Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(label),
      ],
    );
  }
}
