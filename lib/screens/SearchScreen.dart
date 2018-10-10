// With love by ©Ray Okaah - RayOkaah.me | RayOkaah.com | flutterengineer.com | Twitter: @RaysCode | Email: rayokaah@gmail.com
import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/HomeScreen.dart';
import 'package:twitter_clone/models/OtherModels.dart';

/// This is our SearchScreen Class
/// It is responsible for displaying a list of trends and recommended tweets
class SearchScreen extends StatelessWidget {

  /// A list of trends to be displayed on our SearchScreen
  /// It is going to be made up of the Trends model which we created earlier
  final List<Trends> trends = [
    Trends(title: "Wizkid", tweetsNo: "1,820 Tweets"),
    Trends(title: "#Davido", tweetsNo: "4,080 Tweets"),
    Trends(title: "Nigeria", tweetsNo: "8,374 Tweets"),
    Trends(title: "Holiday", tweetsNo: "9,993 Tweets"),
    Trends(title: "#ThursdayMotivation", tweetsNo: "9,939 Tweets"),
    Trends(title: "Happy", tweetsNo: "1,653 Tweets"),

  ];

  /// This is the main build method of this screen
  /// It is responsible for building what is displayed to our screen
  @override
  Widget build(BuildContext context) {

    /// Our build method will return a CustomScrollView
    /// This is neccessary inorder to display a sliver list
    /// Now what does a sliverList do for us? why not the normal listview?
    /// A Sliverlist is a special kind of list with way more flexibility than we
    /// can get from a normal listView.builder class.
    /// It enables us to have multiple lists which could include other slivers and even non slivers
    /// And it seamlessly handles scroll using a CustomScrollView class.
    /// Our build method will return a CustomScrollView

    return new CustomScrollView(
      // Our CustomScrollView class expects a list of slivers
      slivers: <Widget>[
        new SliverAppBar(
          backgroundColor: Colors.white70,
          centerTitle: false,
          title: new Text("Trends for you", style: new TextStyle(color: Colors.black),),
        ),
        new SliverToBoxAdapter(child: Container(height: 0.25, width: double.infinity, color: Colors.black54,)),
        // Using the SliverToBoxAdapter as above, we are able to convert normal Boxes and widgets to Sliver.

        new SliverList(
            delegate: new SliverChildBuilderDelegate((context, index) => _buildTrendsList(context, index),
              childCount: trends.length
        ),),

       new SliverAppBar(
         pinned: true,
         centerTitle: false,
         backgroundColor: Colors.white70,
         floating: false,

         //floating: false,
         //expandedHeight: -50.0,
         title: new ListTile(
           title: new Text("From your feed", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
           subtitle: new Text("Because you follow Diddy and 11 others", style: new TextStyle(fontStyle: FontStyle.italic, fontSize: 13.0),),
           trailing: new Icon(Icons.keyboard_arrow_down),
         ),

       ),
       //new SliverToBoxAdapter(child: _buildTweets()),

        new SliverList(
          delegate: new SliverChildBuilderDelegate((context, index) => HomeScreen().buildTweet(context, index),
              childCount: HomeScreen().allTweets.length
          ),),
       // _buildTrends(),
        //_buildTweets()

      ],
    );

  }

// This method enables us to build our list of Trends
  // we retrieve a Trends object from our list of Trends,
  // and assign them as values to the ListTile class.
  Widget _buildTrendsList(BuildContext context, index){
    Trends trend = trends[index];
    return
    new Column(children: <Widget>[

      ListTile(
      leading: new Text((index +1).toString()),
      title: new Text(trend.title),
      subtitle: new Text(trend.tweetsNo),
        trailing: new Container(child: new Icon(Icons.keyboard_arrow_down),),
    ),
      new Container(height: 0.25, width: double.infinity, color: Colors.black54,)
    ],);
  }

}
