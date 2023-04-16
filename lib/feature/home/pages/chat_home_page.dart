import 'package:flutter/material.dart';
import 'package:harucat/common/routes/routest.dart';

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
        child: Text(' Home Page 1',),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigatToContactPage(context),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
