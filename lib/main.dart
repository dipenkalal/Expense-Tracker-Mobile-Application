import 'package:exptracker/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Second Application',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
      id: '1',
      title: 'Title 1',
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Title 2',
      amount: 199,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'Title 3',
      amount: 299,
      date: DateTime.now(),
    ),
    Transaction(
      id: '4',
      title: 'Title 4',
      amount: 399,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Debugging version 0.1.3'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.black, width: 2)),
              // width: double.infinity,
              // padding: EdgeInsets.all(20),
              child: Card(
                color: Colors.blueGrey,
                child: Text('Chart Area!!'),
                elevation: 8,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: transaction.map((trnx) {
                return Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        trnx.amount.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      Text(trnx.title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87),),
                      Text(trnx.date.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black38),),

                    ]),
                  ],
                );
              }).toList(),
            )
          ],
        ));
  }
}
