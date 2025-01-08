import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  final List<Map<String, String>> chatHistory;

  const MessagePage({Key? key, required this.chatHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat History'),
      ),
      body: ListView.builder(
        itemCount: chatHistory.length,
        itemBuilder: (context, index) {
          final chat = chatHistory[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(chat['catName'] ?? 'Unknown'),
              subtitle: Text(chat['lastMessage'] ?? ''),
            ),
          );
        },
      ),
    );
  }
}
