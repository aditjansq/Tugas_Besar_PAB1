import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget {
  final String catName;
  final Function(String, String) onMessageSent;

  ChatRoomPage({required this.catName, required this.onMessageSent});

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final TextEditingController _messageController = TextEditingController();

  void sendMessage() {
    final message = _messageController.text;
    if (message.isNotEmpty) {
      widget.onMessageSent(widget.catName, message);
      _messageController.clear();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat with ${widget.catName}')),
      body: Column(
        children: [
          Expanded(child: Container()), // Placeholder for chat content
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(hintText: 'Type a message...'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
