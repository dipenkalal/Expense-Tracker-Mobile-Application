import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTrnx extends StatefulWidget {
  final Function addtrnx;

  const NewTrnx(this.addtrnx,{Key? key}) : super(key: key);

  @override
  _NewTrnxState createState() => _NewTrnxState();
}

class _NewTrnxState extends State<NewTrnx> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();


  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);


    if (enteredTitle.isEmpty || enteredAmount <= 0) {
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
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(top: 10,left: 10, right: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 10,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10),
              TextField(
                //autofocus: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Picked Date: ${DateFormat.yMd().format(_selectedDate)}',),
                  CupertinoButton(
                    onPressed: _presentDatePicker,
                    child: const Text(
                      'Choose a Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CupertinoButton.filled(
                onPressed: _submitData,
                child: const Text('Add Your Transaction'),
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
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
