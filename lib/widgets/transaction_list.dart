import 'package:flutter/cupertino.dart';
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
      height: 500,
      child: transactions.isEmpty ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 20),
          Container(

              height: 200,
              child: Image.asset('assets/images/waiting-icon.png', fit: BoxFit.contain,)),

          SizedBox(height: 20),
          Text('No Transactions to show 😃',
            style: TextStyle(
                fontSize: 24,
              fontFamily: 'Montserrat-Black', fontWeight: FontWeight.bold),),


        ],
      ): ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //Container 2(bottom Container)
              children: <Widget>[
            Container(
                padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(left: 10),
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
            ),),
                Container(
                  width: 120.0,
                  alignment: Alignment.bottomRight ,
                  //transaction amount with border box
                  margin: EdgeInsets.only(right: 10),
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
                        color: Theme.of(context).primaryColorDark),
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