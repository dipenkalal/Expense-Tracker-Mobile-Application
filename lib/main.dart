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
        primarySwatch: Colors.deepPurple,

        fontFamily: 'Montserrat',
      ),
      title: 'Second Application',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String titleInput="Enter Transaction";
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: 'Vegetables ',
      amount: 150,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Transportation ',
      amount: 245,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'Utility Bills ',
      amount: 5750,
      date: DateTime.now(),
    ),
    Transaction(
      id: '4',
      title: 'Monthly Memberships ',
      amount: 159,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTrnx{

    return _userTransactions.where((tx){

      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7),),);
    }).toList();

  }

  void _addNewTrnx(String title, double amount,DateTime ChosenDate) {
    final newTrnxs = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: ChosenDate);

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

  void _deleteTrnx(String id){
    setState(() {
      _userTransactions.removeWhere((tx){
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final ui.Size logicalSize = MediaQuery.of(context).size;
    // final double _height = logicalSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Personal Expense Tracker',
          style: TextStyle(
              fontFamily: 'Montserrat-Black', fontWeight: FontWeight.bold),
        ),

        // actions: <Widget>[
        //   IconButton(
        //       onPressed: () => _startAddNewTrnx(context),
        //       icon: Icon(Icons.add_circle_outline)),
        // ],
      ),
      body: SingleChildScrollView(
          child: Column(
        //body part
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          chart(_recentTrnx),
          Container(child: TrnxList(_userTransactions,_deleteTrnx))
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _startAddNewTrnx(context),
        icon: Icon(Icons.add),
        foregroundColor: Colors.white,
        label: const Text('Add Transaction'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
