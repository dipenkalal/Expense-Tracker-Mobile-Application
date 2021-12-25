import 'package:flutter/material.dart';

class chartBar extends StatelessWidget{
  final String label;
  final double spendingAmount;
  final double spendingPerTotal;

  chartBar(this.label,this.spendingAmount, this.spendingPerTotal);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text('Rs' + spendingAmount.toStringAsFixed(0),),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 75,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black38,width: 1.2),
                color: Color.fromRGBO(216, 57, 43, 1)),
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