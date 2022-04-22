import 'package:flutter/cupertino.dart';
import 'package:ninjastudies/network/models/chat_message/chat_message.dart';
import 'package:ninjastudies/network/models/static_conversation/static_conversation.dart';
import 'package:ninjastudies/network/repository/conversation_api_repo.dart';
import 'package:ninjastudies/services/di_service.dart';
import 'package:ninjastudies/utils/utils.dart';

class ConversationProvider extends ChangeNotifier {
  ConversationProvider() {
    initSetup();
  }

  int incorrectAttempCount = 0;
  bool isLoading = false;
  StaticConversation? _staticConversation;
  int staticConversationIndex = 0;
  late ConversationEntity currentStaticConversation;
  bool conversationEnded = false;
  List<ChatMsg> currentMessages = [];

  StaticConversation? get staticConversation => _staticConversation;

  set setStaticConversation(StaticConversation? val) {
    _staticConversation = val;
    isLoading = false;
  }

  initSetup() async {
    await loadStaticConversation();
    // If the static conversation from API is not null we add the first bot msg from the static convo OR we show error msg
    if (staticConversation != null) {
      currentStaticConversation =
          staticConversation!.restaurant[staticConversationIndex];
      addInitialBotMsg();
    }
    notifyListeners();
  }

  addInitialBotMsg() {
    currentMessages.insert(
        0, ChatMsg(message: currentStaticConversation.bot, user: 'bot'));
  }

  Future loadStaticConversation() async {
    isLoading = true;
    notifyListeners();

    setStaticConversation = await sl<ConversationApiRepo>().getStaticConvo();
  }

  loadNextStaticConversation() {
    staticConversationIndex += 1;
    currentStaticConversation =
        staticConversation!.restaurant[staticConversationIndex];
  }

  sendAndAnalyzeHumanMsg(String msg) {
    msg = msg.trim();
    msg = msg.capitalize;
    currentMessages.insert(0, ChatMsg(message: msg, user: 'human'));
    notifyListeners();

    /// checking if conversation ended
    if (staticConversationIndex >= staticConversation!.restaurant.length - 1) {
      conversationEnded = true;
      notifyListeners();
      return;
    }
    List<String> humanRespStringList =
        currentStaticConversation.human.split(" ");
    List<String> msgStringList = msg.split(" ");
    if (msg == currentStaticConversation.human) {
      executeCorrectPhrase(msg);
    } else if (msgStringList.length == humanRespStringList.length) {
      List<String> wrongWord = [];
      List<String> correctWord = [];
      for (var i = 0; i < msgStringList.length; i++) {
        if (msgStringList[i] != humanRespStringList[i]) {
          wrongWord.add(msgStringList[i]);
          correctWord.add(humanRespStringList[i]);
        }
      }
      String botCustomResponse =
          "Use '${Utils.listToString(correctWord)}' instead of '${Utils.listToString(wrongWord)}'";
      executeIncorrectPhrase(botCustomResponse);
    } else if (msgStringList.length < humanRespStringList.length) {
      List<String> missingWords = [];
      for (var item in humanRespStringList) {
        if (!msgStringList.contains(item)) {
          missingWords.add(item);
        }
      }

      String botCustomResponse =
          "you missed '${Utils.listToString(missingWords)}'";
      executeIncorrectPhrase(botCustomResponse);
    } else {
      String botCustomResponse = "Sorry I didn't understood";
      executeIncorrectPhrase(botCustomResponse);
    }
  }

  /// Call this when message from human is correct. It will load next conversation and update the UI
  void executeCorrectPhrase(String msg) {
    loadNextStaticConversation();
    currentMessages.insert(
        0, ChatMsg(message: currentStaticConversation.bot, user: 'bot'));
    incorrectAttempCount = 0;
    notifyListeners();
  }

  /// Call this when message from human is incorrect. It will provide a feedback message and update the UI
  executeIncorrectPhrase(String msg) {
    incorrectAttempCount += 1;
    if (incorrectAttempCount >= 2) {
      msg = "Correct sentence- '${currentStaticConversation.human}'";
    }
    currentMessages.insert(0, ChatMsg(message: msg, user: 'bot'));
    notifyListeners();
  }
}
