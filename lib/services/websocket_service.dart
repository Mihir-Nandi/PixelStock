import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class WebSocketService {
  WebSocketChannel? _channel;
  final ValueNotifier<Map<String, dynamic>> stockUpdates = ValueNotifier({});

  // Connect to WebSocket
  void connect() {
    // Updated for physical device
    final wsUrl = Uri.parse('ws://192.168.1.11:8001/ws/stocks/');

    try {
      print('Connecting to WebSocket...');
      _channel = WebSocketChannel.connect(wsUrl);
      print('Connected to WebSocket!');

      _channel!.stream.listen(
        (message) {
          print(
              'Raw WebSocket message: $message'); // This should show something
          final data = jsonDecode(message);
          print('Received data: $data');
          if (data['message'] != null && data['message']['symbol'] != null) {
            final stockUpdate = data['message'];
            stockUpdates.value = {
              ...stockUpdates.value,
              stockUpdate['symbol']: stockUpdate,
            };
          }
        },
        onError: (error) {
          print('WebSocket error: $error');
          reconnect();
        },
        onDone: () {
          print('WebSocket connection closed');
          reconnect();
        },
      );
    } catch (e) {
      print('WebSocket connection error: $e');
      Future.delayed(const Duration(seconds: 5), reconnect);
    }
  }

  // Reconnect to WebSocket
  void reconnect() {
    disconnect();
    Future.delayed(const Duration(seconds: 5), connect);
  }

  // Disconnect from WebSocket
  void disconnect() {
    _channel?.sink.close();
    _channel = null;
  }
}
