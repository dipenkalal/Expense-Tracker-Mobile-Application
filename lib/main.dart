import 'package:exptracker/widgets/new_transaction.dart';
import 'package:exptracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './models/transaction.dart';
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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String titleInput="Enter Transaction";
  final List<Transaction> _userTransactions = [
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
    ),
    Transaction(
      id: '5',
      title: 'Title 5 ',
      amount: 3999,
      date: DateTime.now(),
    ),
    Transaction(
      id: '6',
      title: 'Title 6',
      amount: 3999,
      date: DateTime.now(),
    ),
  ];

  void _addNewTrnx(String title, double amount) {
    final newTrnxs = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTrnxs);
    });
  }

  void _startAddNewTrnx(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return newTrnx(_addNewTrnx);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Debugging version 0.2.3'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _startAddNewTrnx(context),
              icon: Icon(Icons.add_circle_outline)),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
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
          TrnxList(_userTransactions)
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _startAddNewTrnx(context),
        icon: Icon(Icons.add),
        label: const Text('Add Transaction'),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
