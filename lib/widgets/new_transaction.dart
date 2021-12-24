import 'package:flutter/material.dart';

class newTrnx extends StatefulWidget {
  final Function addtrnx;

  newTrnx(this.addtrnx);

  @override
  State<newTrnx> createState() => _newTrnxState();
}

class _newTrnxState extends State<newTrnx> {
  final TitleController = TextEditingController();

  final AmountController = TextEditingController();

  void submitData(){
    final enteredTitle = TitleController.text;
    final enteredAmount = double.parse( AmountController.text );

    if(enteredTitle.isEmpty||enteredAmount<=0){
      return;
    }
    widget.addtrnx(
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
              //autofocus: true,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Title'),
              controller: TitleController,
              onSubmitted: (_)=> submitData,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Amount'),
              controller: AmountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=> submitData,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: submitData,
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