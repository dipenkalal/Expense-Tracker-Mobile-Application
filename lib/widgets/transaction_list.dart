import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class TrnxList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;


  TrnxList(this.transactions, this.deleteTx);


  @override
  Widget build(BuildContext context) {

    return transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          SizedBox(height: 20),
          Container(
              height: constraints.maxHeight * 0.4,
              child: Image.asset(
                'assets/images/waiting-icon.png',
                fit: BoxFit.contain,
              )),
          SizedBox(height: 20),
          Text(
            'No Transactions to show 😃',
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'Montserrat-Black',
                fontWeight: FontWeight.bold),
          ),
        ],
      );
    })

          : ListView.builder(
                  shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return Card(

                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(

                    leading: CircleAvatar(
                      radius: 35,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: FittedBox(
                            child: Text('${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(icon: Icon(Icons.delete_rounded ), color: Colors.red, onPressed: () => deleteTx(transactions[index].id),),
                  ),
                );
              },
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              itemCount: transactions.length,
    );
  }
}
