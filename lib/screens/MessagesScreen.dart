// With love by ©Ray Okaah - RayOkaah.me | RayOkaah.com | flutterengineer.com | Twitter: @RaysCode | Email: rayokaah@gmail.com
import 'package:flutter/material.dart';
import 'package:twitter_clone/models/OtherModels.dart';

/// This is the Messages Screen of our app,
/// It will display a list of messages retrieved from our data source (a List)
class MessagesScreen extends StatelessWidget {

  /// We need a data source to store all our messages
  /// For the scope of this, we are using a List.
  /// A list allows us to store data objects and retrieve them by their index on that list.
  /// We will hence create a list Called messages, of type "MessageModel".
  /// So this will be a list of our initially created abstract class called Model,
  /// And logically, we would title this list of MessageModel, "messages".
final List<MessageModel> messages = [
  MessageModel(senderName: "Alhaji Dangote", senderHandle: "@Dangote",messageShort: "I have been looking for you",
      time: "2 days ago", senderAvatar: "images/dangote.jpeg"),
  MessageModel(senderName: "Bill Gates", senderHandle: "@BillGates",messageShort: "Send your account number",
      time: "2 days ago", senderAvatar: "images/billgates.jpg"),
  MessageModel(senderName: "Rihanna", senderHandle: "@Rihanna", messageShort: "I saw you in my dream", time: "3 days ago", senderAvatar: "images/rihanna.jpg"),
  MessageModel(senderName: "Jacob Ibe", senderHandle: "@BigJ",
      messageShort: "Good afternoon", time: "4 days ago", senderAvatar: "images/Kuro.jpeg"),
  MessageModel(senderName: "Victoria", senderHandle: "@Avo",messageShort: "How about tommorow?",
      time: "September 21", senderAvatar: "images/onyii.jpeg"),
  MessageModel(senderName: "Ataisi", senderHandle: "@Ataisi",messageShort: "You definitely should lol",
      time: "September 21", senderAvatar: "images/ataisi.jpeg"),
  MessageModel(senderName: "Uncle Sam", senderHandle: "@NoOne", messageShort: "What u seek is classified", time: "September 30", senderAvatar: "images/luckyJack.jpeg"),

];

/// This is the build method for this MessagesScreen Class.
/// It returns everything that should displayed as part of our user interface.
  @override
  Widget build(BuildContext context) {
    return new Scaffold( // returns a material scaffold which forms the backbone / skeleton of our screen
      body:
      // The body of our Home Screen would be a ListView builder
      /// This is responsible for generating our list of messages.
      ListView.builder(
      itemCount: messages.length,
      itemBuilder: _buildTile,
    )
    );
  }
/// This method _buildTile is responsible for building our message Tile
/// It will return a Column widget that contains a listTile and a line divider.
  Widget _buildTile(BuildContext context, int index){

    /// We create a MessageModel object  to represent a single MessageModel in our list
    /// We call it message. It will be used to retrieve MessageModels base on its index position in the list.
    MessageModel message = messages[index]; // We create a message object.
    /// When working with different text, inorder for you
    /// to give different portions of the text different text styles,
    /// we use a widget called RichText. This allows us to style our senderName,
    /// different from our senderHandle.
    Widget displaySender = new RichText( // Implement RichText and call it displaySender
      text: new TextSpan(
        children: <TextSpan> [
          new TextSpan(text: message.senderName, style: new TextStyle( color: Colors.black)),
          new TextSpan(text: " " + message.senderHandle, style: new TextStyle(color: Colors.black54), )
        ]
      ),
    );

    /// As initially mentioned, our _buildTile returns
    /// a Column widget that contains a listTile and a line divider.
    return new Column(children: <Widget>[
    ListTile(
      leading: new CircleAvatar(
        backgroundImage: AssetImage(message.senderAvatar),
      ),
      title: displaySender,
      subtitle: new Container(child: Text(message.messageShort, maxLines: 2,), padding: EdgeInsets.only(bottom: 10.0),),
      trailing: new Text(message.time),
      isThreeLine: false,
    ),
    // we create our line divider below using a container widget and setting the height to 0.25
    new Container(height: 0.25, width: double.infinity, color: Colors.black54,)
    ],);
  }

}
