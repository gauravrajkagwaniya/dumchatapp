import 'package:chat_app/chat_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {


  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = new TextEditingController()
  final List<ChatMessage> _messages =<ChatMessage>[];

  void _handleSubmit(String text){
    _textEditingController.clear();
    ChatMessage messages = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0,messages)
    });
  }

  Widget _textComposerWidget(){
    return new IconTheme(
      data: new IconThemeData(color: Colors.redAccent),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(child: TextField(
                decoration: new InputDecoration.collapsed(hintText: "Send A message"),
                controller: _textEditingController,
                onSubmitted: _handleSubmit,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmit(_textEditingController.text),

              ),
              
            )
          ],
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return  new Column(
      children: <Widget>[
        new Flexible(child: new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_,int index) => _messages[index],
          itemCount: _messages.length,
        ),
        ),
        new Divider(height: 1.0,),
        new Container(
          decoration:  new BoxDecoration(
              color: Theme.of(context).cardColor
          ),
          child: _textComposerWidget(),
        ),
      ],
    );
  }
}
