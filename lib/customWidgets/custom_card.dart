import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/screens/individual_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key key, this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualPage(
                      chatModel: chatModel,
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chatModel.image),
              radius: 30,
            ),
            trailing: Text(chatModel.time),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width: 5),
                Text(
                  chatModel.currentMessage,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            title: Text(
              chatModel.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Divider(
            thickness: 1,
            indent: 80,
            endIndent: 20,
          )
        ],
      ),
    );
  }
}
