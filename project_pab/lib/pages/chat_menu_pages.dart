import 'package:flutter/material.dart';
import 'message_pages.dart';

class ChatMenuPage extends StatelessWidget {
  final List<Map<String, String>> chatHistory = [
    {
      'catName': 'Cat 1',
      'lastMessage': 'Hello, how are you?',
    },
    {
      'catName': 'Cat 2',
      'lastMessage': 'What are you doing?',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Menu'),
      ),
      body: ListView.builder(
        itemCount: chatHistory.length,
        itemBuilder: (context, index) {
          final chat = chatHistory[index];
          return ListTile(
            title: Text(chat['catName'] ?? 'Unknown'),
            subtitle: Text(chat['lastMessage'] ?? ''),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagePage(chatHistory: chatHistory),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
