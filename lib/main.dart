import 'package:exptracker/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

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
    //map concept
    Transaction(
      id: '1',
      title: 'Title 1',
      amount: 1000,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Title 2',
      amount: 1999,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'Title 3',
      amount: 2999,
      date: DateTime.now(),
    ),
    Transaction(
      id: '4',
      title: 'Title 4',
      amount: 3999,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Debugging version 0.1.7'),
        ),
        body: Column(
          //body part
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Container 1(upper Container)
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
            Card(
              child: Container(
                padding:
                EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(decoration: InputDecoration(labelText: 'Title'),),
                    TextField(decoration: InputDecoration(labelText: 'Amount'),),
                    ElevatedButton(onPressed: (){}, child: Text('Add Your Transaction.'), style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent), ), ),
                  ],
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: transaction.map((trnx) {
                return Row(
                  //Container 2(bottom Container)
                  children: <Widget>[
                     Container(
                      //transaction amount with border box
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.redAccent, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Rs ' + trnx.amount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.redAccent),
                      ),
                    ),
                    Column(
                        // transaction title and date with yMMMd format
                        // (column can't be decorated compared to container)
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            trnx.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black87),
                          ),
                          Text(
                            DateFormat.yMMMd('en_US').format(trnx.date),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black38),
                          ),
                        ]),
                  ],
                );
              }).toList(),
            )
          ],
        ));
  }
}
