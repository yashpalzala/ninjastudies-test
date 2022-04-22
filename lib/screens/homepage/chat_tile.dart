import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final int index;
  const ChatTile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(50)),
      ),
      title: Text("Chat $index"),
      subtitle: Text("Hello, this is chat $index"),
    );
  }
}
