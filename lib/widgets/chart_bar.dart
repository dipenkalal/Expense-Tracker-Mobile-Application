import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPerTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPerTotal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      return Column(
        children: <Widget>[
          SizedBox(
              height: constraints.maxHeight * 0.1,
            child: FittedBox(
              child:  Text(
                spendingAmount.toStringAsFixed(0),
              ),
            ),
          ),
          Container(

            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: const Color.fromRGBO(255, 255, 255, 1),
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
          Container(

            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(height: constraints.maxHeight * 0.12,
              child: FittedBox(child: Text(label),
              )
          ),
        ],
      );
    }
    );
  }
}
