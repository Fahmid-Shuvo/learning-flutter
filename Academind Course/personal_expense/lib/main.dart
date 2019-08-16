import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New Shoes', amount: 168, date: DateTime.now()),
    Transaction(id: 't2', title: 'New Phone', amount: 100, date: DateTime.now()),
    Transaction(id: 't3', title: 'New Laptop', amount: 150, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("CHARTS"),
                elevation: 5,
              ),
            ),
            Column(
              children: transactions.map((trans) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          padding: EdgeInsets.all(10),
                          decoration:
                              BoxDecoration(border: Border.all(color: Colors.purple, width: 2)),
                          child: Text(
                            trans.amount.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            trans.title,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            trans.date.toString(),
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
