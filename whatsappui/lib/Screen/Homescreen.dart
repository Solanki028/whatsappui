import 'package:flutter/material.dart';
import 'package:whatsappui/CustomUI/CustomCard.dart';
import 'package:whatsappui/Model/ChatModel.dart';

class Homescreen extends StatefulWidget {
  final List<ChatModel> chatmodels;
  final ChatModel sourchat;

  const Homescreen({Key? key, required this.chatmodels, required this.sourchat}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp Clone"),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  child: Text("New group"),
                  value: "New group",
                ),
                const PopupMenuItem(
                  child: Text("New broadcast"),
                  value: "New broadcast",
                ),
                const PopupMenuItem(
                  child: Text("WhatsApp Web"),
                  value: "WhatsApp Web",
                ),
                const PopupMenuItem(
                  child: Text("Starred messages"),
                  value: "Starred messages",
                ),
                const PopupMenuItem(
                  child: Text("Settings"),
                  value: "Settings",
                ),
              ];
            },
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          const Text("Camera"),
          ListView.builder(
            itemCount: widget.chatmodels.length,
            itemBuilder: (context, index) {
              return CustomCard(chatModel: widget.chatmodels[index]);
            },
          ),
          const Text("Status"),
          const Text("Calls"),
        ],
      ),
    );
  }
}
