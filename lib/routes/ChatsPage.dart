import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../constance.dart';

class Chat extends StatefulWidget {
  static const String id = "CHAT";
  //final FirebaseUser user;

  //const Chat({Key key, this.user}) : super(key: key);

  final _auth = FirebaseAuth.instance;
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('messages').add({
        'text': messageController.text,
        'from': _auth.currentUser.email,//widget.user.email,
        'date': DateTime.now().toIso8601String().toString(),
      });
      messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /* leading: Hero(
          tag: 'logo',
          child: Container(
            height: 40.0,
            child: Image.asset("assets/images/logo.png"),
          ),
        ),*/
        backgroundColor: KMainColor,
       title: Text("Inbox"),
        actions: <Widget>[
        /*  IconButton(
            //icon: Icon(Icons.close),
            onPressed: () {
              _auth.signOut();
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          )*/
        ],

      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('messages')
                    .orderBy('date')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  List<DocumentSnapshot> docs = snapshot.data.documents;

                  List<Widget> messages = docs
                      .map((doc) => Message(
                    from: doc.data()['from'],
                    text: doc.data()['text'],
                    me: _auth.currentUser.email==doc.data()['from'],//widget.user.email == doc.data()['from'],
                  ))
                      .toList();

                  return ListView(
                    controller: scrollController,
                    children: <Widget>[
                      ...messages,
                    ],
                  );
                },
              ),
            ),

            Container(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) => callback(),
                      decoration: InputDecoration(
                        hintText: "Enter a Message...",
                        hintStyle: TextStyle(color: Colors.black54),
                       // border: const OutlineInputBorder(),
                          border: InputBorder.none
                      ),
                      controller: messageController,
                    ),
                  ),
                  SizedBox(width: 15,height: 80,),
                 FloatingActionButton(
                    onPressed: callback,
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.purple[800],
                   // elevation: 0,
                  ),
                  /*SendButton(
                    text: "Send",
                    callback: callback,

                  )*/

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const SendButton({Key key, this.text, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
     color: Colors.purple[800],
      onPressed: callback,
      child: Text(text),
    );

  }
}

class Message extends StatelessWidget {
  final String from;
  final String text;

  final bool me;

  const Message({Key key, this.from, this.text, this.me}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:
        me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            from,
          ),
          Material(
            color: me ? Colors.purple[700] : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
              child: Text(
                text,
              ),
            ),
          )
        ],
      ),
    );
  }
}