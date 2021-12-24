import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TrnxList extends StatelessWidget {

  final List<Transaction> transactions;
  TrnxList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              //Container 2(bottom Container)
              children: <Widget>[
            Expanded(
            child: Container(
                padding: EdgeInsets.all(10.0),
            child: (Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                Text(
                        transactions[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black87),
                      ),
                      SizedBox(height: 6),
                      Text(
                        DateFormat.yMMMd('en_US').format(transactions[index].date),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black38),
                      ),
                    ])
            ),),),
                Container(
                  width: 120.0,
                  alignment: Alignment.bottomRight ,
                  //transaction amount with border box
                  margin:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      //border:
                      //Border.all(color: Colors.redAccent, width: 2)
                      ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Rs ' + transactions[index].amount.toStringAsFixed(0),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.redAccent),
                  ),
                ),
              ],
            ),
          );
        },
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      itemCount: transactions.length,
      ),
    );
  }
}