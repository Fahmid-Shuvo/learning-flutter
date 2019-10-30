import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Movies Votes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// int itemCount() {
//   Firestore.instance.collection('movies').getDocuments().then((snaps) {
//     return snaps.documents.length;
//   });
// }

void addMovie(BuildContext ctx, String movieName) {
  if (movieName.isEmpty) {
    return;
  }
  final dbRef = Firestore.instance.collection('movies').document();
  Firestore.instance.runTransaction((transaction) async {
    DocumentSnapshot freshSnap = await transaction.get(dbRef);
    await transaction.set(freshSnap.reference, {'name': movieName, 'votes': 0});
    Navigator.of(ctx).pop();
  });
}

void showBottomModal(BuildContext ctx) {
  final movieNameController = TextEditingController();

  showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  controller: movieNameController,
                  decoration: InputDecoration(
                    labelText: 'Movie Name',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                OutlineButton(
                  child: Text('Add'),
                  onPressed: () => addMovie(ctx, movieNameController.text),
                  borderSide: BorderSide(color: Colors.purple, width: 2),
                )
              ],
            ),
          ),
        );
      });
}

Future<void> _getUpdatedCollection() {
  return Firestore.instance.collection('movies').getDocuments();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.movie),
          label: Text("Add Movies"),
          onPressed: () => showBottomModal(context),
        ),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('movies').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();
              return RefreshIndicator(
                onRefresh: () => _getUpdatedCollection(),
                child: ListView.separated(
                  separatorBuilder: (_, index) => Divider(),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (ctx, index) =>
                      buildListTile(context, snapshot.data.documents[index]),
                ),
              );
            }));
  }

  Widget buildListTile(BuildContext context, DocumentSnapshot document) {
    return InkWell(
      onTap: () {
        Firestore.instance.runTransaction((transaction) async {
          DocumentSnapshot freshSnap =
              await transaction.get(document.reference);
          await transaction
              .update(freshSnap.reference, {'votes': freshSnap['votes'] + 1});
        });
      },
      child: ListTile(
          leading: Text('${document['name']}'),
          trailing: Text('${document['votes']}')),
    );
  }
}
