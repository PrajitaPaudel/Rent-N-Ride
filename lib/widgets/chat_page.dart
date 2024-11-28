import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/storage/app_storage.dart';
import '../service/message_service.dart';



  // Import HTTP service

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late SignalRService _signalRService;
  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize SignalRService and the connection with the user's username
    _signalRService = SignalRService();
    _signalRService.initializeConnection('prajita');  // Initialize with your username here
  }

  @override
  void dispose() {
    // Stop the SignalR connection and clean up resources when the widget is disposed
    _signalRService.stopConnection();
    super.dispose();
  }

  // Method to handle sending a message
  void _sendMessage() {
    String messageContent = _messageController.text;
    if (messageContent.isNotEmpty) {
      _signalRService.sendMessage('sanjana', messageContent); // Replace 'sanjana' with dynamic recipient
      _messageController.clear();  // Clear input after sending
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<String>(
              stream: _signalRService.messageStream,  // Listen to incoming messages from SignalR
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No messages yet'));
                } else {
                  return ListView(
                    children: [
                      ListTile(
                        title: Text(snapshot.data!), // Display the received message
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: "Type a message"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,  // Send message on press
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

