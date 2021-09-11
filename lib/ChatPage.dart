import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:image_picker/image_picker.dart';

final _store = FirebaseFirestore.instance;
User? loggedInUser;

class ChatPage extends StatefulWidget {
  static const String id = 'Chat_Screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatPage> {
  final _auth = FirebaseAuth.instance;
  final textController = TextEditingController();
  late String text;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetCurrentUser();
  }

  void GetCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: (value) {
                        //Do something with the user input.
                        text = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      //Implement send functionality.
                      textController.clear();
                      _store.collection('messages').add({
                        'text': text,
                        'sender': loggedInUser!.email,
                        'time_server': FieldValue.serverTimestamp(),
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _store
          .collection('messages')
          .orderBy('time_server', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final text = message['text'];
          final sender = message['sender'];

          final messageBubble = MessageBubble(
            fromCurrentuser: sender == loggedInUser!.email,
            text: text,
            sender: sender,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            children: messageBubbles,
            reverse: true,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {required this.sender,
      required this.text,
      required this.fromCurrentuser});
  final String sender;
  final String text;
  final bool fromCurrentuser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: (!fromCurrentuser)
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          (!fromCurrentuser) ? CircleAvatar() : Container(),
          Container(
            width: 5,
          ),
          Column(
            crossAxisAlignment: fromCurrentuser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                sender,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
              Material(
                borderRadius: fromCurrentuser
                    ? BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0))
                    : BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                color: Colors.white,
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 5,
          ),
          (fromCurrentuser)
              ? GestureDetector(
                  onTap: () async {
                    print('dada');
                    XFile? image = await new ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    File imageFile = File(image!.path);
                    String filePath = image.name;
                    await FirebaseStorage.instance
                        .ref('profileImages/$filePath')
                        .putFile(imageFile);
                    _store
                        .collection('users')
                        .where('userId', isEqualTo: loggedInUser!.uid)
                        .get()
                        .then(
                            (value) => print(value.docs.first['profileImage']));
                  },
                  child: CircleAvatar(),
                )
              : Container(),
        ],
      ),
    );
  }
}
