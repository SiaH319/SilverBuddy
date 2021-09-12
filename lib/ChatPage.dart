import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';

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
  String myUrl = "";
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
        _store
            .collection('users')
            .where('uid', isEqualTo: loggedInUser!.uid)
            .get()
            .then((value) => myUrl = value.docs[0].data()['profileImage']);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: null,
      //   actions: <Widget>[
      //     IconButton(
      //         icon: Icon(Icons.close),
      //         onPressed: () {
      //           //Implement logout functionality
      //           _auth.signOut();
      //           Navigator.pop(context);
      //         }),
      //   ],
      //   title: Text('⚡️Chat'),
      //   backgroundColor: Colors.lightBlueAccent,
      // ),
      bottomNavigationBar: Container(
        height: 90,
        width: 100,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/back.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/menu.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/profile.png'),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 1000,
              height: 50,
              color: Color(0xff712EFF).withOpacity(0.1),
              child: Center(
                child: Text(
                  'GROUP CHAT (5)',
                  style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            MessageStream(),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 13,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/plus1.png'),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
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
                    Column(
                      children: [
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/smile.png'),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        //Implement send functionality.
                        textController.clear();
                        _store.collection('messages').add({
                          'text': text,
                          'sender': loggedInUser!.email,
                          'time_server': FieldValue.serverTimestamp(),
                          'url': myUrl,
                        });
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/send.png'),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    // FlatButton(
                    //   onPressed: () {
                    //     //Implement send functionality.
                    //     textController.clear();
                    //     _store.collection('messages').add({
                    //       'text': text,
                    //       'sender': loggedInUser!.email,
                    //       'time_server': FieldValue.serverTimestamp(),
                    //       'url': myUrl,
                    //     });
                    //   },
                    //   child: Text(
                    //     'Send',
                    //     style: kSendButtonTextStyle,
                    //   ),
                    // ),
                  ],
                ),
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
          final url = message['url'];
          final messageBubble = MessageBubble(
            fromCurrentuser: sender == loggedInUser!.email,
            text: text,
            sender: sender,
            url: url,
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
  MessageBubble({
    required this.sender,
    required this.text,
    required this.fromCurrentuser,
    required this.url,
  });
  final String sender;
  final String url;
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
          (!fromCurrentuser)
              ? CircleAvatar(
                  backgroundImage: NetworkImage(url),
                )
              : Container(),
          Container(
            width: 5,
          ),
          Column(
            crossAxisAlignment: fromCurrentuser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: <Widget>[
              // Text(
              //   sender,
              //   style: TextStyle(
              //     fontSize: 12.0,
              //     color: Colors.red,
              //   ),
              // ),
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
                color: fromCurrentuser ? Color(0xff83A2EF) : Color(0xffFFE99C),
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: fromCurrentuser ? Colors.white : Colors.black,
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
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(url),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
