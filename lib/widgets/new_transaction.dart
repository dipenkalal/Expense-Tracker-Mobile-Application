import 'package:flutter/material.dart';

class newTrnx extends StatelessWidget {
  final Function addtrnx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  //newTrnx(void Function(String title, int amount) addNewTrnx);

  newTrnx(this.addtrnx);

  void SubmitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse( amountController.text );

    if(enteredTitle.isEmpty||enteredAmount<=0){
      return;
    }
    addtrnx(
        enteredTitle,
        enteredAmount,
    );
  }

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
              onSubmitted: (_)=> SubmitData,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=> SubmitData,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: SubmitData,
              // (
              //     ) {
              //
              // },
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