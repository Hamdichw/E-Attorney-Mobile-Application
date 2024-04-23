import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../../model/messages.dart';
import '../../utils/function.dart';

class Chat_Page extends StatefulWidget {
  final int chatid;
  final String username;
  final String lawyername;
  final String lawyeimage;
  const Chat_Page(
      {super.key,
      required this.chatid,
      required this.username,
      required this.lawyername,
      required this.lawyeimage});

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

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
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
      final dynamic jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      final chatMessage = jsonResponse;
      types.Message newMessage;
      final author = chatMessage['senderName'] == widget.username
          ? _user
          : types.User(
              id: chatMessage['senderName'],
              imageUrl: widget.lawyeimage,
            );

      String message = chatMessage['replymessage'] as String;
      print(message);
      if (message.contains('https') &&
          (message.contains('.png') ||
              message.contains('.jpg') ||
              message.contains('.jpeg') ||
              message.contains('.gif'))) {
        newMessage = types.ImageMessage(
          author: author,
          createdAt: DateTime.parse(chatMessage['time']).millisecondsSinceEpoch,
          id: chatMessage['id'].toString(),
          name: '',
          size: 1,
          uri: message, // Corrected parameter name
        );
      } else if (message.contains('https') && (message.contains('.pdf'))) {
        newMessage = types.FileMessage(
          author: author,
          createdAt: DateTime.parse(chatMessage['time']).millisecondsSinceEpoch,
          id: chatMessage['id'].toString(),
          name: 'document',
          size: 3,
          uri: message, // Corrected parameter name
        );
      } else {
        newMessage = types.TextMessage(
          author: author,
          createdAt: DateTime.parse(chatMessage['time']).millisecondsSinceEpoch,
          id: chatMessage['id'].toString(),
          text: message,
        );
      }

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

  void _handleSendPressed(types.PartialText message) async {
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
      Uri.parse('https://backendserver.cleverapps.io/chats/add/message1'),
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

    print(response.statusCode);
    if (response.statusCode == 200) {
      final List<dynamic> jsonMessages =
          jsonDecode(utf8.decode(response.bodyBytes));
      final List<types.Message> newMessages = jsonMessages.map((json) {
        final chatMessage = ChatMessage.fromJson(json);
        final author = chatMessage.senderName == widget.username
            ? _user // If sender is current user, use _user as author
            : types.User(
                id: chatMessage.senderName,
                imageUrl: widget.lawyeimage,
              ); // Otherwise, use sender's name
        // Check if the message contains a link to an image
        if (chatMessage.replyMessage.contains('https') &&
            (chatMessage.replyMessage.contains('.png') ||
                chatMessage.replyMessage.contains('.jpg') ||
                chatMessage.replyMessage.contains('.jpeg') ||
                chatMessage.replyMessage.contains('.gif'))) {
          // Create an ImageMessage if the message contains a link to an image
          return types.ImageMessage(
            author: author,
            createdAt: DateTime.parse(chatMessage.time).millisecondsSinceEpoch,
            id: chatMessage.id.toString(),
            name: '', size: 1,
            uri: chatMessage.replyMessage, // Corrected parameter name
          );
        } else if (chatMessage.replyMessage.contains('https') &&
            (chatMessage.replyMessage.contains('.pdf'))) {
          // Create an ImageMessage if the message contains a link to an image
          return types.FileMessage(
            author: author,
            createdAt: DateTime.parse(chatMessage.time).millisecondsSinceEpoch,
            id: chatMessage.id.toString(),
            name: 'document', size: 3,
            uri: chatMessage.replyMessage, // Corrected parameter name
          );
        } else {
          // Create a TextMessage for other messages
          // Check if replyMessage is null and replace it with an empty string
          final replyMessage = chatMessage.replyMessage;
          return types.TextMessage(
            author: author,
            createdAt: DateTime.parse(chatMessage.time).millisecondsSinceEpoch,
            id: chatMessage.id.toString(),
            text: replyMessage,
          );
        }
      }).toList();
      setState(() {
        _messages
            .addAll(newMessages.toList()); // Reverse and append new messages
      });
    } else {
      print("error dali ${response.statusCode}");
    }
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _handleImageSelection();
                        },
                        icon: Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 40,
                        )),
                    Text("Photo")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _handleFileSelection();
                        },
                        icon: Icon(
                          Icons.upload_file,
                          size: 40,
                        )),
                    Text("File")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.cancel_outlined,
                          size: 40,
                          color: Colors.red[700],
                        )),
                    Text("Cancel")
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      XFile img = await compressImage(result);
      List<int> imageBytes = await File(img.path).readAsBytes();
      var request = http.MultipartRequest('POST',
          Uri.parse('https://api.cloudinary.com/v1_1/dli3d373m/upload'));
      request.files.add(http.MultipartFile.fromBytes(
        'file',
        imageBytes,
        filename: path.basename(result.path), // Extracting filename from path
      ));
      request.fields['upload_preset'] = 'clq99pfo';
      var response = await request.send();
      final responseBody = await response.stream.bytesToString();
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(responseBody);
        final jsonResponse = jsonDecode(responseBody);
        print(jsonResponse['secure_url']);

        // Parse the message from the response
        _handleSendPressed(types.PartialText(text: jsonResponse['secure_url']));
      } else {
        print("error fetching last message: ${response.statusCode}");
      }
    }
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null && result.files.single.path != null) {
      List<int> fileBytes = await File(result.files.single.path!).readAsBytes();
      var request = http.MultipartRequest('POST',
          Uri.parse('https://api.cloudinary.com/v1_1/dli3d373m/upload'));
      request.files.add(http.MultipartFile.fromBytes(
        'file',
        fileBytes,
        filename: path.basename(result.files.single.path!),
      ));
      request.fields['upload_preset'] = 'clq99pfo';
      var response = await request.send();
      final responseBody = await response.stream.bytesToString();
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(responseBody);
        final jsonResponse = jsonDecode(responseBody);
        print(jsonResponse['secure_url']);

        // Parse the message from the response
        _handleSendPressed(types.PartialText(text: jsonResponse['url']));
      } else {
        print("error fetching last message: ${response.statusCode}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theMe = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          //elevation: 15,
          shape: Border(
              bottom: BorderSide(
                  width: 1, color: const Color.fromARGB(131, 0, 0, 0))),
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: theMe.textTheme.bodyMedium!.color!, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.network(
                    widget.lawyeimage,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                widget.lawyername,
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          backgroundColor: theMe.backgroundColor,
        ),
        body: Chat(
          messages: _messages.reversed.toList(),
          onAttachmentPressed: _handleAttachmentPressed,
          onSendPressed: _handleSendPressed,
          onMessageTap: _handleMessageTap,
          showUserAvatars: true,
          showUserNames: true,
          user: _user,
          theme: DefaultChatTheme(
              seenIcon: Text(
                'read',
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
              inputBackgroundColor: Colors.grey,
              inputTextColor: Colors.black,
              inputMargin: EdgeInsets.only(left: 0, right: 0),
              inputBorderRadius: BorderRadius.vertical(top: Radius.circular(0)),
              backgroundColor: theMe.scaffoldBackgroundColor),
        ),
      ),
    );
  }
}
