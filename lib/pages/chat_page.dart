import 'package:flutter/material.dart';
import 'package:whatsapp_clone/customWidgets/custom_card.dart';
import 'package:whatsapp_clone/models/chat_model.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      currentMessage: 'Hi There',
      name: "Paul Imoke",
      time: "17:45",
      isGroup: false,
      image:
          "https://images.unsplash.com/photo-1586716402203-79219bede43c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cG90cmFpdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    ),
    ChatModel(
      currentMessage: 'Maybe Later',
      name: "Other Person",
      time: "6:50",
      isGroup: false,
      image:
          "https://images.unsplash.com/photo-1531384441138-2736e62e0919?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cG90cmFpdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    ),
    ChatModel(
      currentMessage: 'Yes',
      name: "The Group Page",
      time: "11:29",
      isGroup: true,
      image:
          "https://images.unsplash.com/photo-1531844251246-9a1bfaae09fc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z3JvdXB8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        onPressed: () {},
      ),
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            return CustomCard(
              chatModel: chats[index],
            );
          }),
    );
  }
}
