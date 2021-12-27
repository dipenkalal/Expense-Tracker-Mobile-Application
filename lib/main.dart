import 'package:exptracker/widgets/chart_bar.dart';
import 'package:exptracker/widgets/new_transaction.dart';
import 'package:exptracker/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './models/transaction.dart';

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
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTrnx(String title, double amount, DateTime ChosenDate) {
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
      title: Text(
        'Personal Expense Tracker',
        style: TextStyle(
            fontFamily: 'Montserrat-Black', fontWeight: FontWeight.bold),
      ),
    );
    final txListWidget = Container(
        height: (mQuery.size.height -
            appBar.preferredSize.height -
            mQuery.padding.top) *
            0.7,
        child: TrnxList(_userTransactions, _deleteTrnx));
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
          child: Column(
        //body part
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (isLandscape) Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            Text('Show Chart'),
            Switch(value: _showChart, onChanged: (val){
              setState(() {
                _showChart=val;
              });
            } ),
          ],
          ),
           if (!isLandscape) Container(
               height: (mQuery.size.height -
                   appBar.preferredSize.height -
                   mQuery.padding.top) *
                   0.28,
               child: chart(_recentTrnx)),
           if (!isLandscape) txListWidget,
          if (isLandscape) _showChart ? Container(
              height: (mQuery.size.height -
                      appBar.preferredSize.height -
                  mQuery.padding.top) *
                  0.75,
              child: chart(_recentTrnx))
          : txListWidget
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _startAddNewTrnx(context),
        icon: Icon(Icons.add),
        foregroundColor: Colors.white,
        label: const Text('ADD'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
