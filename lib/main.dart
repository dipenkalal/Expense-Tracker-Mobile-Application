import 'package:exptracker/widgets/user_transactions.dart';
import 'package:flutter/material.dart';
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
  // String titleInput="Enter Transaction";
  // String amountInput="Enter the amount";
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Debugging version 0.1.8'),
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
            usertrnx()
          ],
        ));
  }
}
