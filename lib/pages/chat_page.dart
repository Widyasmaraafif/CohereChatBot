import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dash_chat_2/dash_chat_2.dart';

// Ganti dengan API Key dari Cohere
const String COHERE_API_KEY = "YOUR_COHERE_API_KEY";

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatUser _currentUser = ChatUser(
    id: '1',
    firstName: 'User',
  );

  final ChatUser _aiUser = ChatUser(
    id: '2',
    firstName: 'Cohere AI',
  );

  List<ChatMessage> _messages = <ChatMessage>[];
  bool _isTyping = false; // Status AI sedang mengetik atau tidak

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 166, 126, 1),
        title: const Text(
          'Cohere Chat',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: DashChat(
              currentUser: _currentUser,
              messageOptions: const MessageOptions(
                currentUserContainerColor: Colors.black,
                containerColor: Color.fromRGBO(0, 166, 126, 1),
                textColor: Colors.white,
              ),
              typingUsers: _isTyping ? [_aiUser] : [], // Menampilkan AI sedang mengetik
              onSend: (ChatMessage m) {
                getChatResponse(m);
              },
              messages: _messages,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      _isTyping = true; // AI mulai mengetik
    });

    const String endpoint = "https://api.cohere.com/v1/generate";

    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        "Authorization": "Bearer $COHERE_API_KEY",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "model": "command",
        "prompt": m.text,
        "max_tokens": 500, // Bisa dinaikkan untuk jawaban lebih panjang
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        _messages.insert(
          0,
          ChatMessage(
            user: _aiUser,
            createdAt: DateTime.now(),
            text: data["generations"][0]["text"],
          ),
        );
      });
    } else {
      setState(() {
        _messages.insert(
          0,
          ChatMessage(
            user: _aiUser,
            createdAt: DateTime.now(),
            text: "⚠️ Error ${response.statusCode}: Gagal mendapatkan respons.",
          ),
        );
      });
    }

    setState(() {
      _isTyping = false; // AI selesai mengetik
    });
  }
}
