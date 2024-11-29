import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:logging/logging.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signalr_netcore/signalr_client.dart';

import '../model/message_model.dart';
import '../storage/app_storage.dart';
import '../utils/constants/app_constant.dart';

import 'package:flutter/material.dart';
import 'package:signalr_netcore/signalr_client.dart';

import 'package:flutter/material.dart';
import 'package:signalr_netcore/signalr_client.dart';



class ChatPageScreen extends StatefulWidget {
  final String userName;

  const ChatPageScreen({required this.userName, Key? key}) : super(key: key);

  @override
  State<ChatPageScreen> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPageScreen> {
  late HubConnection connection;
  bool isConnectionInitialized = false;
  final TextEditingController messageTextController = TextEditingController();
  final ScrollController chatListScrollController = ScrollController();
  List<MessageModel> messages = [];

  @override
  void initState() {
    super.initState();
    initializeConnection();
  }

  @override
  void dispose() {
    if (connection.state == HubConnectionState.Connected) {
      connection.stop();
    }
    messageTextController.dispose();
    chatListScrollController.dispose();
    super.dispose();
  }

  Future<void> initializeConnection() async {
    String? token = AppStorage.getToken(); // Replace with actual token retrieval logic

    try {
      connection = HubConnectionBuilder()
          .withUrl(
        AppConstant.BASE_URL+'chathub',
        options: HttpConnectionOptions(
          accessTokenFactory: () async => token??"",
        ),
      )
          .withAutomaticReconnect()
          .build();

      connection.on('ReceiveMessage', (message) {
        print("Received message: $message"); // Add this debug log.

        // Inspect the message structure
        if (message != null && message.isNotEmpty) {
          // Assuming `message` is an array with a single object.
          if (message[0] is Map<String, dynamic>) {
            _handleIncomingMessages(message[0]); // Pass the object to the handler.
          } else {
            print("Message format invalid: $message");
          }
        } else {
          print("Received null or empty message.");
        }
      });

      // Timer.periodic(Duration(seconds: 20), (timer) {
      //   print("Connection state: ${connection.state}");
      // });


      // Correctly define the onclose callback with nullable error handling
      connection.onclose((Object? error) {
        Exception? exceptionError = error as Exception?;
        if (exceptionError != null) {
          print("SignalR connection closed with error: $exceptionError");
        } else {
          print("SignalR connection closed without error.");
        }
      } as ClosedCallback);




      await connection.start();
      setState(() {
        isConnectionInitialized = true;
      });
      print("SignalR connection initialized successfully.");
    } catch (e) {
      print("Error initializing SignalR connection: $e");
    }
  }

  Future<void> _handleIncomingMessages(Object? args) async {
    if (args == null) return;

    try {
      if (args is Map<String, dynamic>) {
        final newMessage = MessageModel.fromJson(args);
        setState(() {
          messages.add(newMessage);
        });

        // Auto-scroll to the latest message
        Future.delayed(const Duration(milliseconds: 100), () {
          chatListScrollController.animateTo(
            chatListScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      }
    } catch (e) {
      print("Error processing incoming message: $e");
    }
  }

  Future<void> submitMessageFunction() async {
    if (!isConnectionInitialized) {
      print("Connection not ready.");
      return;
    }

    final messageText = messageTextController.text.trim();
    if (messageText.isEmpty) {
      print("Message is empty.");
      return;
    }

    try {
      await connection.invoke('SendMessageToUser', args: [widget.userName, messageText]);
      print("Message sent successfully.");
      setState(() {
        messages.add(MessageModel(

          userId: AppStorage.getUserId(),
          userName: widget.userName,
          messageText: messageText,
        ));
      });
      messageTextController.clear();
    } catch (e) {
      print("Error sending message: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat with ${widget.userName}")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: chatListScrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Text(message.userName ?? "Unknown"),
                  subtitle: Text(message.messageText ?? ""),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageTextController,
                    decoration: const InputDecoration(hintText: "Enter message"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: submitMessageFunction,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
