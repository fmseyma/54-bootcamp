import 'package:antello/classes/chat_messages.dart';
import 'package:antello/widgets/chat_row_card.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: ChatData.length,
                itemBuilder: (context, index) => ChatCard(
                      yazisma: ChatData[index],
                      bas: () {},
                    )))
      ],
    );
  }
}
