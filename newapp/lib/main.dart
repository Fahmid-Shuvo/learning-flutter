// Flutter code sample for material.RaisedButton.1

// This sample shows how to render a disabled RaisedButton, an enabled RaisedButton
// and lastly a RaisedButton with gradient background.
//
// ![Three raised buttons, one enabled, another disabled, and the last one
// styled with a blue gradient background](https://flutter.github.io/assets-for-api-docs/assets/material/raised_button.png)

import 'package:flutter/material.dart';
import 'screen2.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

/// This Widget is the main application widget.

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String _title = 'Flutter Code Sample';
  var customThemeColor = Brightness.light;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      routes: <String, WidgetBuilder>{
        '/screen2': (BuildContext context) => Screen2()
      },
      home: Builder(
          builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text(_title),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      Navigator.pushNamed(context, '/screen2');
                    },
                  )
                ],
              ),
              drawer: Drawer(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Image(image: AssetImage('images/bg.png')),
                        Row(children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 40.0, left: 10.0),
                              child: CircleAvatar(
                                  radius: 40.0,
                                  backgroundImage:
                                      AssetImage('images/person.jpg'))),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(left: 30.0),
                                    child: Text(
                                      'John Smith',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 30.0),
                                    child: Text(
                                      'Ratting: 5',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    )),
                              ],
                            ),
                          )
                        ])
                      ],
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text('Home'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.motorcycle),
                          title: Text('Trips'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.map),
                          title: Text('Map'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Settings'),
                          onTap: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.color_lens),
                onPressed: () {
                  setState(() {
                    customThemeColor = customThemeColor == Brightness.dark
                        ? Brightness.light
                        : Brightness.dark;
                  });
                },
              ),
              body: SingleChildScrollView(child: MyStatefulWidget()))),
      theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          accentColor: Colors.red,
          brightness: customThemeColor),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool checkBoxValue = false;
  int radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10.0, top: 10.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search ...'),
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
            Checkbox(
              value: checkBoxValue,
              onChanged: (bool value) {
                print(value);
                setState(() {
                  checkBoxValue = value;
                });
              },
            ),
            ButtonBar(
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: radioValue,
                  onChanged: (int value) {
                    setState(() {
                      radioValue = value;
                    });
                  },
                ),
                Radio(
                  value: 2,
                  groupValue: radioValue,
                  onChanged: (int value) {
                    setState(() {
                      radioValue = value;
                    });
                  },
                )
              ],
            ),
            Card(
                child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: <Widget>[
                  Image(
                      height: 200,
                      width: 200,
                      image: AssetImage('images/man.jpg'),
                      fit: BoxFit.cover),
                  Row(children: <Widget>[
                    IconButton(
                      icon:
                          Icon(Icons.person, textDirection: TextDirection.ltr),
                      onPressed: () {
                        print('Person 1');
                      },
                    ),
                    Expanded(
                        child: Text('John Smith',
                            textDirection: TextDirection.ltr)),
                    IconButton(
                      icon: Icon(Icons.add, textDirection: TextDirection.ltr),
                      onPressed: () {
                        print('add');
                      },
                    ),
                  ])
                ],
              ),
            )),
            Card(
                child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: <Widget>[
                        Image(
                            height: 200,
                            width: 200,
                            image: AssetImage('images/man.jpg'),
                            fit: BoxFit.cover),
                        Row(children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.person,
                                textDirection: TextDirection.ltr),
                            onPressed: () {
                              print('Person 1');
                            },
                          ),
                          Expanded(
                              child: Text('John Doe',
                                  textDirection: TextDirection.ltr)),
                          IconButton(
                            icon: Icon(Icons.add,
                                textDirection: TextDirection.ltr),
                            onPressed: () {
                              print('add');
                            },
                          ),
                        ])
                      ],
                    ))),
            Card(
                child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: <Widget>[
                        Image(
                            height: 200,
                            width: 200,
                            image: AssetImage('images/man.jpg'),
                            fit: BoxFit.cover),
                        Row(children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.person,
                                textDirection: TextDirection.ltr),
                            onPressed: () {
                              print('Person 1');
                            },
                          ),
                          Expanded(
                              child: Text('John Doe',
                                  textDirection: TextDirection.ltr)),
                          IconButton(
                            icon: Icon(Icons.add,
                                textDirection: TextDirection.ltr),
                            onPressed: () {
                              print('add');
                            },
                          ),
                        ])
                      ],
                    ))),
          ],
        ));
  }
}

/// This is the stateless widget that the main application instantiates.
// class MyStatelessWidget extends StatelessWidget {
//   MyStatelessWidget({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           const RaisedButton(
//             onPressed: null,
//             child: Text('Disabled Button', style: TextStyle(fontSize: 20)),
//           ),
//           const SizedBox(height: 30),
//           RaisedButton(
//             onPressed: () {},
//             child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
//           ),
//           const SizedBox(height: 30),
//           RaisedButton(
//             onPressed: () {},
//             textColor: Colors.white,
//             padding: const EdgeInsets.all(0.0),
//             child: Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: <Color>[
//                     Color(0xFF0D47A1),
//                     Color(0xFF1976D2),
//                     Color(0xFF42A5F5),
//                   ],
//                 ),
//               ),
//               padding: const EdgeInsets.all(10.0),
//               child:
//                   const Text('Gradient Button', style: TextStyle(fontSize: 20)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
