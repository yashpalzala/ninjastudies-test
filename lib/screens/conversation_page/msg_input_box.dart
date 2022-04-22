import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ninjastudies/providers/conversation_provider.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class MsgInputBox extends StatefulWidget {
  const MsgInputBox({Key? key}) : super(key: key);

  @override
  State<MsgInputBox> createState() => _MsgInputBoxState();
}

class _MsgInputBoxState extends State<MsgInputBox> {
  final TextEditingController _msgC = TextEditingController();
  bool _isListening = false;
  late stt.SpeechToText _speech;

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        debugLogging: true,
        options: [stt.SpeechToText.androidIntentLookup],
        finalTimeout: const Duration(seconds: 5),
        onStatus: (val) {
          // use log to print only in debug mode
          log('onStatus: $val');
          if (val == 'done') {
            setState(() {
              _isListening = false;
            });
          }
        },
        onError: (val) => log('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
            onResult: (val) => _msgC.value = TextEditingValue(
                text: val
                    .recognizedWords) /* setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }), */
            );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  void initState() {
    _speech = stt.SpeechToText();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              controller: _msgC,
              decoration: const InputDecoration(hintText: "Type/Speak message"),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    _listen();
                  },
                  child: Icon(
                    Icons.mic,
                    color: _isListening ? Colors.blue : Colors.black,
                    size: 30,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  context
                      .read<ConversationProvider>()
                      .sendAndAnalyzeHumanMsg(_msgC.text);
                  _msgC.clear();
                },
                child: const Icon(
                  Icons.send,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
