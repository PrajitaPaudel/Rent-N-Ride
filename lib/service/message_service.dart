import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:signalr_netcore/signalr_client.dart';
import 'package:vehicle_rental_frontendui/storage/app_storage.dart';
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';

import 'package:signalr_netcore/signalr_client.dart';
import 'dart:convert';
 // Make sure you have this package in pubspec.yaml

class SignalRService {
  late HubConnection _hubConnection;
  String? token = AppStorage.getToken(); // Replace with your token

  // Constructor to initialize the connection
  SignalRService() {
    _hubConnection = HubConnectionBuilder()
        .withUrl(AppConstant.BASE_URL+'chathub', options: HttpConnectionOptions(
      accessTokenFactory: () async => token ?? "",
    ))
        .build();
  }

  final StreamController<String> _messageStreamController = StreamController<String>.broadcast();

  Stream<String> get messageStream => _messageStreamController.stream;

  // Initialize SignalR connection
  Future<void> initializeConnection(String userName) async {
    try {
      await _hubConnection.start();
      print('SignalR Hub connected');
    } catch (error) {
      print('Error starting SignalR Hub connection: $error');
    }

    // Listen for incoming messages
    _hubConnection.on('ReceiveMessage', (message) {
      if (message != null && message.isNotEmpty && message[0] != null) {
        _messageStreamController.sink.add(message[0].toString());
      } else {
        print('Received null or empty message');
      }
    });
  }

  // Send a message using SignalR
  void sendMessage(String recipientUserName, String messageContent) async {
    if (_hubConnection.state == HubConnectionState.Connected) {
      try {
        await _hubConnection.invoke('SendMessageToUser', args: [recipientUserName, messageContent]);
        print('Message sent successfully via SignalR');
      } catch (e) {
        print('Error sending message via SignalR: $e');
        await sendMessageViaApi(recipientUserName, messageContent); // Fallback to API if SignalR fails
      }
    } else {
      print('Hub connection is not connected. Current state: ${_hubConnection.state}');
      await sendMessageViaApi(recipientUserName, messageContent); // Fallback to API if SignalR is not connected
    }
  }

  Future<void> sendMessageViaApi(String recipientUserName, String messageContent) async {
    const apiUrl = AppConstant.BASE_URL+'api/Message/send'; // API URL for fallback message sending

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "SenderId": AppStorage.getUserId(), // Replace with actual user ID
          "RecipientUserName": recipientUserName,
          "Content": messageContent,
        }),
      );

      if (response.statusCode == 200) {
        print('Message sent successfully via API');
      } else {
        print('Failed to send message via API: ${response.body}');
      }
    } catch (e) {
      print('Error sending message via API: $e');
    }
  }

  void stopConnection() {
    _hubConnection.stop();
    _messageStreamController.close();
  }
}
