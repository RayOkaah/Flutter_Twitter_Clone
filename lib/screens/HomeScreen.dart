// With love by ©Ray Okaah - RayOkaah.me | RayOkaah.com | flutterengineer.com | Twitter: @RaysCode | Email: rayokaah@gmail.com
import 'package:flutter/material.dart';
import 'package:twitter_clone/models/TweetModel.dart';

/// This is the Home screen of our app
/// It will display a list of tweets on your Timeline just like you would see on Twitter
/// Below its a stateless Widget, it i
class HomeScreen extends StatelessWidget { //Our HomeScreen is a stateless widget
// and that's because it does not accept user input or change
// from an external source and hence do not need to rebuild.

/// We need a data source to store all the tweets to be displayed on our Timeline
  /// For the scope of this, we are using a List.
  /// A list allows us to store data objects and retrieve them by their index on that list.
  /// We will hence create a list Called allTweets, of type "Tweet".
  /// So this will be a list of our initially created abstract class called Tweet,
  /// And logically, we would title this list of Tweet, "allTweets".

  final List<Tweet> allTweets = [

    TweetWithImage1(textInput: "I had a really wonderful day with my friends",
        retweets: "273", likes: "1005", imageUrl: "images/rihanna1.jpg", avatar: "images/rihanna.jpg", name: "Rihanna Boma", handle: "@Rihanna"),

    TweetWithTextOnly(textInput: "When feeling overwhelmed by a faraway goal, repeat the following: "
        "I have it within me right now, to get me to where I want to be later",
        retweets: "3.5k", likes: "4.9k", avatar: "images/prosper.jpg", name: "Prosper", handle: "@unicodeveloper"),

    TweetWithImage3(textInput: "To me family is everything", retweets: "4.9k", likes: "7k",
      imageUrl1: "images/davido3.jpg", imageUrl2: "images/davido.jpg", imageUrl3: "images/davido2.jpg", avatar: "images/davido.jpg", name: "Davido OBO", handle: "@davido"),

    TweetWithImage2(textInput: "You are beautiful, dont let anybody tell you you're not.",
      retweets: "200", likes: "212", imageUrl1: "images/wizkid1.jpg", imageUrl2: "images/wizkid.jpg", avatar: "images/wizkid.jpg", name: "Wizkid", handle: "@WizkidAyo" ),

    TweetWithImage4(textInput: "My favorite artists in one tweet", retweets: "17.5k", likes: "63.8k",
        imageUrl1: "images/bigsean1.jpg", imageUrl2: "images/bigsean3.jpg", imageUrl3: "images/wizkid.jpg", imageUrl4: "images/bigsean2.jpg", avatar: "images/ray.jpg", name: "Ray Okaah", handle: "@RaysCode"
    )
  ];

/// This is the build method for this HomeScreen Class.
  /// It returns everything that should displayed as part of our user interface.
  @override
  Widget build(BuildContext context) {

    return Scaffold( // returns a material scaffold which forms the backbone / skeleton of our screen.
      body:
          /// The body of our Home Screen would be a ListView builder
      /// This is responsible for generating our list of tweets.
      ListView.builder(
          itemBuilder: buildTweet, // The actual widget responsible for what gets displayed
        itemCount: allTweets.length, // The number of items the list should display
      ),
    );

  } // Ends our Screens build method.


  /// Now our UI for the HomeScreen will be broken down into 4 parts.
  /// 1. The Top (The Title).
  /// 2. The Content (Text and image(s) )
  /// 3. The Bottom ( Bottom buttons eg; like, retweet, etc)
  ///


  /// The _buildTitle method is responsible for building the components
  /// that make the Title part of our screen.
  /// Here it takes in two parameters namely;
  /// 1. name; which is the name of the user retrieved from our allTweets list
  /// 2. Handle; which is the Twitter handle of same user retrieved from our allTweets data source.
  Widget _buildTitle(String name, handle){
    return new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Row(children: <Widget>[
          new Text(name, style: new TextStyle(fontWeight: FontWeight.bold),),
          new Text (handle),
        ],),

        new Column(crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Icon(Icons.keyboard_arrow_down), //alignment: Alignment.topRight,),
          ],),

      ],
    );
  }

  /// The _buildTweetContent method is responsible
  /// for building what makes up our tweet tile, including the title, bottom etc.
  /// This method will accept three parameters, namely;
  /// 1. The material BuildContext
  /// 2. Remember in our model class we had several types of Tweets.
  /// So the second variable is called meTweet and is used to denote a tweet with a variable type.
  /// 3. The 3rd parameter is called picToBuild and tells this our _buildTweetContent method
  /// exactly how many pictures it should build for.
  Widget _buildTweetContent(BuildContext context, var meTweet, Widget picToBuild){
    return new Column(
        children: <Widget>[
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(child:CircleAvatar(radius: 30.0, backgroundImage: AssetImage(meTweet.avatar),),
                margin: EdgeInsets.all(10.0),),
              new Flexible(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(bottom: 2.0)),
                    _buildTitle(meTweet.name, meTweet.handle),
                    new Padding(padding: EdgeInsets.only(bottom: 2.0)),
                    new Text(meTweet.textInput, style: Theme.of(context).textTheme.body1,),
                    new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                    picToBuild,
                    _buildBottomButtons(context, meTweet.retweets, meTweet.likes),
                  ],
                ), flex: 1,)
            ],),
          new Container(height: 0.25, width: double.infinity, color: Colors.black45,)
        ]);
  }

  /// This is the _buildBottomButtons method,
  /// responsible for building the button buttons of our Tweet tile.

  Widget _buildBottomButtons(BuildContext context, String retweets, String likes){
    return new Container(margin: EdgeInsets.only(top: 10.0, bottom: 5.0, right: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Icon(Icons.reply, size: 15.0,),
            // new Image.asset("images/reply.png", height: 15.0, width: 15.0,),

            new Row(mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                //Icon(Icons.loop, size: 15.0,),
                new Image.asset("images/retweet.png", height: 20.0, width: 20.0,),
                // Above, decided to use a png image in place of the initial material icon.
                new Padding(padding: EdgeInsets.only(right: 5.0)),
                new Text(retweets)
              ],),

            new Row(children: <Widget>[
              Icon(Icons.favorite_border, size: 15.0,),
              new Padding(padding: EdgeInsets.only(right: 5.0)),
              new Text(likes)
            ],),

            Icon(Icons.share, size: 15.0,)
          ],
        ));
  }
/// You should remember our _buildTweetContent method requires a parameter
  /// called picToBuild. This parameter tells it how many pictures to build for.
  /// It returns a widget.

/// _noImage method returns a build method for pics with no image.
  Widget _noImage(){
    return new Padding(padding: EdgeInsets.only(top: 0.01));
  }
/// _oneImage method returns a build method for pics with One Image.
  Widget _oneImage(var singleTweet){
    return new Container(child: Image.asset(singleTweet.imageUrl), padding: EdgeInsets.only(right: 10.0),);
  }
  /// _twoImages method returns a build method for pics with Two Images.
  Widget _twoImages(var singleTweet){
    return new Row(
        mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Expanded(child:  Image.asset(singleTweet.imageUrl1, fit: BoxFit.contain,), flex: 1,),
            new Expanded(child:  Image.asset(singleTweet.imageUrl2, fit: BoxFit.contain,),flex: 1,),
            new Padding(padding: EdgeInsets.only(right: 10.0))
          ]);
  }
  /// _threeImages method returns a build method for pics with three Images
  Widget _threeImages(var singleTweet){
    return new Row (
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[

        new Column(children: <Widget>[ new Image.asset(singleTweet.imageUrl1, fit: BoxFit.cover, height: 200.0, width: 150.0, ),],),

        new Column(children: <Widget>[
          Image.asset(singleTweet.imageUrl2, fit: BoxFit.contain, height: 100.0),
          Image.asset(singleTweet.imageUrl3, fit: BoxFit.contain, height: 100.0),
          new Padding(padding: EdgeInsets.only(right: 10.0))

        ],),


      ],);
  }
  /// _fourImages method returns a build method for pics with four Images
  Widget _fourImages(var singleTweet){
    return new Column(children: <Widget>[
    Row(//mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Expanded(child:  Image.asset(singleTweet.imageUrl1, fit: BoxFit.cover, height: 200.0,), flex: 1,),
          new Expanded(child:  Image.asset(singleTweet.imageUrl2, fit: BoxFit.cover, height: 200.0,),flex: 1,),
          new Padding(padding: EdgeInsets.only(right: 10.0))
        ]),

    new Row(mainAxisSize: MainAxisSize.min,
    children: <Widget>[
    new Expanded(child:  Image.asset(singleTweet.imageUrl3, fit: BoxFit.cover, height: 200.0, ), flex: 1,),
    new Expanded(child:  Image.asset(singleTweet.imageUrl4, fit: BoxFit.cover, height: 200.0),flex: 1,),
    new Padding(padding: EdgeInsets.only(right: 10.0))
    ]),
    ],);
  }


  /// Once we have built our UI we still have a challenge.
  /// How can we tell which tweet is single image and which is for 3 images?
  /// Now here's what we do
  /// we create this buildTweet method that returns a widget,
  /// we then work with the abstract class and Tweet models
  ///
  /// What we do here is straight foward, we control what the buildTweet return HomeScreen build method.
  /// So if a tweet from our list is of type 3 images, then build tweet should only return a view made to handle 3 images.
  /// It should do same for other types of tweets as well.

  Widget buildTweet(BuildContext context, int index){
    Tweet singleTweet = allTweets[index];


    if (singleTweet is TweetWithTextOnly){

      return _buildTweetContent(context, singleTweet, _noImage());

    }
    else if (singleTweet is TweetWithImage1){
      return _buildTweetContent(context, singleTweet, _oneImage(singleTweet));
    }

    else if (singleTweet is TweetWithImage2){
      return _buildTweetContent(context, singleTweet, _twoImages(singleTweet));

    }

    else if (singleTweet is TweetWithImage3){
      return _buildTweetContent(context, singleTweet, _threeImages(singleTweet));
    }

    else if (singleTweet is TweetWithImage4){
      return _buildTweetContent(context, singleTweet, _fourImages(singleTweet));
    }

    else {
      return new Text("No Tweet found");
    }

  }

}
