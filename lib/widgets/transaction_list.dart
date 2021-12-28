import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TrnxList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TrnxList(this.transactions, this.deleteTx, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                SizedBox(
                    height: constraints.maxHeight * 0.4,
                    child: Image.asset(
                      'assets/images/waiting-icon.png',
                      fit: BoxFit.contain,
                    )),
                const SizedBox(height: 20),
                const Text(
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
              return Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Card(

                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
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
                    trailing: MediaQuery.of(context).size.width > 400
                        ? ElevatedButton.icon(
                            onPressed: () => deleteTx(transactions[index].id),
                            icon: const Icon(Icons.delete_rounded),
                            label: const Text('Delete'))
                        : IconButton(
                            icon: const Icon(Icons.delete_rounded),
                            color: Colors.red,
                            onPressed: () => deleteTx(transactions[index].id),
                          ),
                  ),
                ),
              );
            },
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            itemCount: transactions.length,
          );
  }
}
