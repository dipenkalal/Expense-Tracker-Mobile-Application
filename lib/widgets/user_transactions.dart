import 'package:flutter/widgets.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class usertrnx extends StatefulWidget {
  @override
  _userTransactionState createState() => _userTransactionState();
}

class _userTransactionState extends State<usertrnx> {
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
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        newTrnx(),
        TrnxList()
      ],
    );
  }
}