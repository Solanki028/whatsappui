import 'package:flutter/material.dart';
import 'package:whatsappui/Model/ChatModel.dart'; // Ensure this path is correct

class ChatPage extends StatelessWidget {
  final List<ChatModel> chatModels;

  ChatPage({required this.chatModels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
      ),
      body: ListView.builder(
        itemCount: chatModels.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Icon(chatModels[index].icon),
            ),
            title: Text(chatModels[index].name),
            subtitle: Text(chatModels[index].status), // Ensure 'status' exists in ChatModel
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(
                    chatModel: chatModels[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatDetailPage extends StatelessWidget {
  final ChatModel chatModel;

  ChatDetailPage({required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              child: Icon(chatModel.icon),
            ),
            SizedBox(width: 10),
            Text(chatModel.name),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  child: Text("View Contact"),
                  value: "View Contact",
                ),
                const PopupMenuItem(
                  child: Text("Media, links, and docs"),
                  value: "Media, links, and docs",
                ),
                const PopupMenuItem(
                  child: Text("Search"),
                  value: "Search",
                ),
                const PopupMenuItem(
                  child: Text("Mute notifications"),
                  value: "Mute notifications",
                ),
                const PopupMenuItem(
                  child: Text("Wallpaper"),
                  value: "Wallpaper",
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    "Hello, how are you?",
                    textAlign: TextAlign.start,
                  ),
                ),
                ListTile(
                  title: Text(
                    "I'm good, how about you?",
                    textAlign: TextAlign.end,
                  ),
                ),
                ListTile(
                  title: Text(
                    "I'm fine too.",
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.grey[200],
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.emoji_emotions),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
