import 'package:flutter/material.dart';
// import 'screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHomePage(title: 'T o D o S'),
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
  String input = "";
  List list = List();
  @override
  void initState() {
    super.initState();
    list.add('Data 1');
    // list.add('Data 2');
    // list.add('Data 3');
    // list.add('Data 4');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Center(child: Text(widget.title)),
          backgroundColor: const Color(0xFFFFFF),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Add Todo'),
                    content: TextField(
                      autofocus: true,
                      onChanged: (value) {
                        input = value;
                      },
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      RaisedButton(
                        color: Colors.green,
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            list.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: <Widget>[
            Text(
              'Swipe to Delete ToDo',
              style: TextStyle(fontSize: 15, color: Colors.purple),
            ),
            Text(
              'Hold to edit ToDo',
              style: TextStyle(fontSize: 15, color: Colors.purple),
            ),
            Scrollbar(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(index.toString()),
                    child: Card(
                      elevation: 8.0,
                      margin:
                          EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(64, 75, 96, .9)),
                          child: Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text(
                              list[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                    onDismissed: (direction) {
                      print(direction);
                      setState(() {
                        list.removeAt(index);
                      });
                    },
                  );
                },
              ),
            )
          ],
        ));
  }
}
