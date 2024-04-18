import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../model/messages.dart';
import '../../utils/function.dart';

class Chat_Page extends StatefulWidget {
  final int chatid;
  final String username;
  final String image;
  const Chat_Page(
      {super.key,
      required this.chatid,
      required this.username,
      required this.image});

  @override
  State<Chat_Page> createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {
  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _fetchMessages();
    _startPolling();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer in dispose
    super.dispose();
  }

  void _startPolling() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _fetchLastMessage();
    });
  }

  void _fetchLastMessage() async {
    // Fetch the last message from your API
    String? token = await getToken();
    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    final response = await http.get(
      Uri.parse(
          'https://backendserver.cleverapps.io/chats/last/message/from/chat/${widget.chatid}'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final dynamic jsonResponse = jsonDecode(response.body);
      // Parse the message from the response
      final chatMessage = jsonResponse;
      //print(chatMessage);

      // Create a types.Message from the last message
      final author = chatMessage['senderName'] == widget.username
          ? _user
          : types.User(id: chatMessage['senderName']);
      final newMessage = types.TextMessage(
        author: author,
        createdAt: DateTime.parse(chatMessage['time']).millisecondsSinceEpoch,
        id: chatMessage['id'].toString(),
        text: chatMessage['replymessage'],
      );

      // Check if the widget is still mounted before calling setState
      if (mounted) {
        // Check if the last message received is different from the last one displayed
        if (_messages.last.id != newMessage.id) {
          setState(() {
            _messages.add(newMessage);
          });
          print(_messages.length);
          // Force a rebuild of the chat interface
        }
      }
    } else {
      print("error fetching last message: ${response.statusCode}");
    }
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: Uuid().v4(),
      text: message.text,
    );

    //_addMessage(textMessage);
    String? token = await getToken();
    final Map<String, dynamic> requestBody = {
      "senderName":
          widget.username, // Assuming _user.id contains the sender's name
      "replymessage": message.text,
      "chat": {"chatId": widget.chatid} // Assuming chat ID is 1
    };
    // Send the message to your API
    final response = await http.post(
      Uri.parse(
          'https://backendserver.cleverapps.io/chats/add/message${widget.chatid}'),
      body: jsonEncode(requestBody),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode != 200) {
      // Handle error
    }
  }

  void _fetchMessages() async {
    // Fetch messages from your API
    String? token = await getToken();
    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    final response = await http.get(
        Uri.parse(
            'https://backendserver.cleverapps.io/chats/all/messages/from/chat/${widget.chatid}'),
        headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> jsonMessages = jsonDecode(response.body);
      final List<types.Message> newMessages = jsonMessages.map((json) {
        final chatMessage = ChatMessage.fromJson(json);
        final author = chatMessage.senderName == widget.username
            ? _user // If sender is current user, use _user as author
            : types.User(
                id: chatMessage.senderName); // Otherwise, use sender's name
        return types.TextMessage(
          author: author,
          createdAt: DateTime.parse(chatMessage.time).millisecondsSinceEpoch,
          id: chatMessage.id.toString(),
          text: chatMessage.replyMessage,
        );
      }).toList();

      setState(() {
        _messages
            .addAll(newMessages.toList()); // Reverse and append new messages
      });
    } else {
      print("error dali ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Chat(
              messages: _messages.reversed.toList(),
              onSendPressed: _handleSendPressed,
              showUserAvatars: true,
              showUserNames: true,
              user: _user,
              theme: const DefaultChatTheme(
                seenIcon: Text(
                  'read',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              )),
        ),
      );
}
