import 'package:exptracker/widgets/new_transaction.dart';
import 'package:exptracker/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './models/transaction.dart';
import 'dart:ui' as ui;
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Montserrat',
      ),
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
    // Transaction(
    //   id: '1',
    //   title: 'Title 1',
    //   amount: 100,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '2',
    //   title: 'Title 2',
    //   amount: 1999,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '3',
    //   title: 'Title 3',
    //   amount: 2999,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '4',
    //   title: 'Title 4',
    //   amount: 3999,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTrnx{

    return _userTransactions.where((tx){

      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7),),);
    }).toList();

  }

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
        title: Text(
          'Debugging version 0.3.1',
          style: TextStyle(
              fontFamily: 'Montserrat-Black', fontWeight: FontWeight.bold),
        ),
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
          chart(_recentTrnx),


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
