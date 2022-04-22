import 'package:flutter/material.dart';
import 'package:ninjastudies/network/models/chat_message/chat_message.dart';
import 'package:ninjastudies/providers/conversation_provider.dart';
import 'package:ninjastudies/screens/conversation_page/msg_input_box.dart';
import 'package:ninjastudies/utils/size_config.dart';
import 'package:provider/provider.dart';

class ConversationBody extends StatelessWidget {
  const ConversationBody({Key? key}) : super(key: key);
  final double msgBoxHeight = 50;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Consumer<ConversationProvider>(builder: (context, prov, _) {
      return Column(
        children: [
          Expanded(
            child: SizedBox(
              // height: SizeConfig.heightExcludingAppbar! - msgBoxHeight,
              child: ListView.builder(
                  reverse: true,
                  itemCount: prov.currentMessages.length,
                  itemBuilder: (context, index) {
                    ChatMsg _chatMsg = prov.currentMessages[index];

                    return Row(
                      mainAxisAlignment: _chatMsg.user == 'bot'
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: _chatMsg.user == 'bot'
                                    ? Colors.grey
                                    : Colors.blue),
                            alignment: Alignment.center,
                            child: Text(
                              _chatMsg.message ?? " ",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
          SizedBox(height: msgBoxHeight, child: const MsgInputBox())
        ],
      );
    });
  }
}
