import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class newTrnx extends StatefulWidget {
  final Function addtrnx;

  newTrnx(this.addtrnx);

  @override
  _newTrnxState createState() => _newTrnxState();
}

class _newTrnxState extends State<newTrnx> {
  final _TitleController = TextEditingController();
  final _AmountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();


  void _submitData() {
    final enteredTitle = _TitleController.text;
    final enteredAmount = double.parse(_AmountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addtrnx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2099),
    ).then((pickDate) {
      if (pickDate==null){
        return;
      }
      setState(() {
        _selectedDate = pickDate;
      });

    } );
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        //height: 250 ,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            TextField(
              //autofocus: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Title'),
              controller: _TitleController,
              onSubmitted: (_) => _submitData,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Amount'),
              controller: _AmountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_selectedDate == null ? 'No Date Chosen' : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',),
                CupertinoButton(
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Choose a Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CupertinoButton.filled(
              onPressed: _submitData,
              child: Text('Add Your Transaction'),
              // style: ElevatedButton.styleFrom(
              //     primary: Colors.redAccent,
              //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              //     textStyle:
              //     const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              // style: ButtonStyle(
              //   backgroundColor:
              //   MaterialStateProperty.all<Color>(Colors.redAccent),
              // ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
