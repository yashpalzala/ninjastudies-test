import 'package:flutter/material.dart';
import 'package:ninjastudies/screens/conversation_page/conversation_page.dart';
import 'package:ninjastudies/network/repository/conversation_api_repo.dart';
import 'package:ninjastudies/screens/homepage/chat_tile.dart';
import 'package:ninjastudies/services/di_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // called the API to prefetch data
    sl<ConversationApiRepo>().getStaticConvo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            for (var i = 0; i < 2; i++)
              ChatTile(
                index: i + 1,
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ConversationPage(),
              ));
        },
        child: const Icon(Icons.add_comment),
      ),
    );
  }
}
