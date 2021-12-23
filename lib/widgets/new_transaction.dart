import 'package:flutter/material.dart';

class newTrnx extends StatelessWidget {
  final Function addtrnx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  //newTrnx(void Function(String title, int amount) addNewTrnx);

  newTrnx(this.addtrnx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Title'),
              controller: titleController,
            ),
            SizedBox(height: 10),
            TextField(

              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Amount'),
              controller: amountController,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: (
                  ) {
                addtrnx(titleController.text,double.parse(amountController.text));
              },
              child: Text('Add Your Transaction.'),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.redAccent),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}