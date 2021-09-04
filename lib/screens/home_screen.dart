import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/chat_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatsapp Clone"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text('New group'),
                value: 'New group',
              ),
              PopupMenuItem(
                child: Text('New Broadcast'),
                value: 'New Broadcast',
              ),
              PopupMenuItem(
                child: Text('Whatsapp Web'),
                value: 'WhatsApp Web',
              ),
              PopupMenuItem(
                child: Text('Starred Messages'),
                value: 'Starred Messages',
              ),
              PopupMenuItem(
                child: Text('Settings'),
                value: 'Settings',
              ),
            ];
          })
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Text('0'),
          ChatPage(),
          Text('2'),
          Text('3'),
        ],
      ),
    );
  }
}
