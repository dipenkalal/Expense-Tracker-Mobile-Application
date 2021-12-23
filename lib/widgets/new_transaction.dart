import 'package:flutter/material.dart';

class newTrnx extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
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
                print(titleController.text);
                print(amountController.text);
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