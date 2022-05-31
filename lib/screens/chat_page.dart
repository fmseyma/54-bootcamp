import 'package:flutter/material.dart';
import '../widgets/chat_app_bar.dart';
import '../widgets/chat_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(context),
      body: const ChatWidget(),
    );
  }
}
