import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/profile.dart';
import './pages/search.dart';
import './pages/notification.dart';
import './pages/create-post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Instagram'),
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
  final List<Widget> pages = [
    Home(),
    Search(),
    CreatePost(),
    NotificationPage(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Scaffold(
          body: TabBarView(
            children: pages,
          ),
          bottomNavigationBar: Container(
            child: new TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    size: 30,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.add_circle_outline,
                    size: 30,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.favorite_border,
                    size: 30,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.perm_identity,
                    size: 30,
                  ),
                ),
              ],
              unselectedLabelColor: Colors.black,
              labelColor: Colors.purple,
              indicatorColor: Colors.transparent,
            ),
          ),
        ));
  }
}
