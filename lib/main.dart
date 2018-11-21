// With love by ©Ray Okaah - RayOkaah.me | RayOkaah.com | flutterengineer.com | Twitter: @RaysCode | Email: rayokaah@gmail.com
import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/HomeScreen.dart';
import 'package:twitter_clone/screens/MessagesScreen.dart';
import 'package:twitter_clone/screens/NotificationsScreen.dart';
import 'package:twitter_clone/screens/SearchScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your whole application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        //primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // The _MyHomePageState build method is going to build our tabBars and TabViews
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new DefaultTabController(
          length: 4, child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Twitter"),
          bottom: new TabBar(
              isScrollable: true,
              tabs: [
                new Container(child: Tab(icon: new Icon(Icons.home), ), width: 50.0,),
                new Container(child: Tab(icon: new Icon(Icons.search), ), width: 50.0,),
                new Container(child: Tab(icon: new Icon(Icons.notifications_none), ), width: 50.0,),
                new Container(child: Tab(icon: new Icon(Icons.mail_outline), ), width: 50.0,),
              ]),
        ),
        body: TabBarView(
            children: [ // Remember the sequence of this classes below is important
              new HomeScreen(),
              new SearchScreen(),
              new NotificationsScreen(),
              new MessagesScreen()
            ]),
      )),
    );
  }
}
