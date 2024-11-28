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

class ChatPageScreen extends StatefulWidget {
  final String userName;

  const ChatPageScreen({required this.userName, Key? key}) : super(key: key);

  @override
  State<ChatPageScreen> createState() => _ChatPageScreenState();
}

class _ChatPageScreenState extends State<ChatPageScreen> {
  late HubConnection connection;
  bool isConnectionInitialized = false;
  final TextEditingController messageTextController = TextEditingController();
  final ScrollController chatListScrollController = ScrollController();
  List<MessageModel> messageModel = [];

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
    String? token = AppStorage.getToken();

    try {
      connection = HubConnectionBuilder()
          .withUrl(
        '${AppConstant.BASE_URL}chathub?access_token=${Uri.encodeComponent(token ?? "")}',
        options: HttpConnectionOptions(
          accessTokenFactory: () => Future.value(token),
        ),
      )
          .build();

      connection.on('ReceiveMessage', (message) {
        if (message != null && message.isNotEmpty) {
          _handleIncomingMessages(message[0]);
        }
      });

      connection.onclose((error) {
        print("Connection closed: $error");
      } as ClosedCallback);

      await connection.start();
      setState(() {
        isConnectionInitialized = true;
      });
      print("SignalR connection established.");
    } catch (e) {
      print("Error connecting to SignalR: $e");
      setState(() {
        isConnectionInitialized = false;
      });
    }
  }

  Future<void> _handleIncomingMessages(Object? args) async {
    if (args == null) return;

    try {
      if (args is Map<String, dynamic>) {
        final data = MessageModel.fromJson(args);
        setState(() {
          messageModel.add(data);
        });

        // Auto-scroll to latest message
        Future.delayed(const Duration(milliseconds: 100), () {
          chatListScrollController.animateTo(
            chatListScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      } else {
        print("Unexpected message format: $args");
      }
    } catch (e) {
      print("Error handling incoming message: $e");
    }
  }

  Future<void> submitMessageFunction() async {
    if (!isConnectionInitialized) {
      print("Connection is not initialized.");
      return;
    }

    final messageText = messageTextController.text.trim();
    if (messageText.isEmpty || widget.userName.isEmpty) {
      print("Message text or username is empty.");
      return;
    }

    try {
      await connection.invoke('SendMessageToUser', args: [
        widget.userName,
        messageText,
      ]);
      messageTextController.clear();
    } catch (e) {
      print("Error sending message: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: chatListScrollController,
              itemCount: messageModel.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messageModel[index].userName ?? "Unknown"),
                  subtitle: Text(messageModel[index].messageText ?? ""),
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
                    decoration: const InputDecoration(
                      hintText: "Type your message",
                    ),
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

