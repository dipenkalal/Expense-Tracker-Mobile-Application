import 'dart:io';
import 'package:exptracker/widgets/new_transaction.dart';
import 'package:exptracker/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

import './widgets/chart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Montserrat',
      ),
      title: 'Second Application',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
    Transaction(
      id: '5',
      title: 'Vegetables ',
      amount: 150,
      date: DateTime.now(),
    ),
    Transaction(
      id: '6',
      title: 'Transportation ',
      amount: 245,
      date: DateTime.now(),
    ),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTrnx {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTrnx(String title, double amount, DateTime chosenDate) {
    final newTrnxs = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: chosenDate);

    setState(() {
      _userTransactions.add(newTrnxs);
    });
  }

  void _startAddNewTrnx(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return NewTrnx(_addNewTrnx);
      },
    );
  }

  void _deleteTrnx(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mQuery = MediaQuery.of(context);
    final isLandscape = mQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: const Text(
        'Personal Expense Tracker',
        style: TextStyle(
            fontFamily: 'Montserrat-Black', fontWeight: FontWeight.bold),
      ),
      actions: const <Widget>[
        ],
    );
    final txListWidget = SizedBox(
        height: (mQuery.size.height -
            appBar.preferredSize.height -
            mQuery.padding.top) *
            0.62,
        child: TrnxList(_userTransactions, _deleteTrnx));
    final pageBody = SafeArea(child: SingleChildScrollView(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape) Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const Text('Show Chart'),
                Switch.adaptive(value: _showChart, onChanged: (val){
                  setState(() {
                    _showChart=val;
                  });
                } ),
              ],
            ),
            if (!isLandscape) SizedBox(
                height: (mQuery.size.height -
                    appBar.preferredSize.height -
                    mQuery.padding.top) *
                    0.28,
                child: Chart(_recentTrnx)),
            if (!isLandscape) txListWidget,
            if (isLandscape) _showChart ? SizedBox(
                height: (mQuery.size.height -
                    appBar.preferredSize.height -
                    mQuery.padding.top) *
                    0.75,
                child: Chart(_recentTrnx))
                : txListWidget
          ],
        )),
    );
    final floatingAB = Platform.isIOS ? Container()
        : CupertinoButton.filled(
      child: const Text('Add New Transaction'),
      onPressed: () => _startAddNewTrnx(context)
    );
    
    return Platform.isIOS? CupertinoPageScaffold(child: pageBody ,) : Scaffold(
      appBar: appBar,
      body: pageBody,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingAB
      );
  }
}
