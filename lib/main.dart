import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Second Application',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Debugging version 0.1.1'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20), 
              child: Card(
                color: Colors.blueGrey,
                child: Text('Chart Area!!'),
                elevation: 8,
              ),
            ),
            Card(
              child: Text('List of Transaction Area!!'),
            )
          ],
        ));
  }
}
