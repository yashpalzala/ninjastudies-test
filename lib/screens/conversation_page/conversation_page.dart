import 'package:flutter/material.dart';
import 'package:ninjastudies/providers/conversation_provider.dart';
import 'package:ninjastudies/screens/common/error_ui.dart';
import 'package:ninjastudies/screens/common/loading_ui.dart';
import 'package:ninjastudies/screens/conversation_page/conversation_body.dart';
import 'package:provider/provider.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConversationProvider(),
      child: Builder(builder: (context) {
        return Consumer<ConversationProvider>(builder: (context, prov, _) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Conversation Page"),
              ),
              body: prov.isLoading
                  ? const LoadingUI()
                  : prov.staticConversation == null
                      ? const ErrorUI()
                      : const ConversationBody());
        });
      }),
    );
  }
}
