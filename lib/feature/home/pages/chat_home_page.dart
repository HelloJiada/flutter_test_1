import 'package:flutter/material.dart';
import 'package:jadeapp/common/routes/routest.dart';

class ChatHomePage extends StatefulWidget {
  const ChatHomePage({super.key});

  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {

navigatToContactPage(context) {
  Navigator.pushNamed(context, Routes.contact);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Chat Home Page',),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigatToContactPage(context),
        child: const Icon(Icons.chat),
      ),
    );
  }
}
