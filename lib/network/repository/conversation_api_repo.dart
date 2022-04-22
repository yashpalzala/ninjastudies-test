import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:ninjastudies/constants/api_endpoints.dart';
import 'package:ninjastudies/network/models/static_conversation/static_conversation.dart';

class ConversationApiRepo {
  String baseUrl;
  ConversationApiRepo(this.baseUrl);
  static StaticConversation? staticConversationCache;

  /// This function will return Future<StaticConversation?>? from cache if available or else will call the API
  Future<StaticConversation?>? getStaticConvo() async {
    try {
      if (staticConversationCache != null) return staticConversationCache;
      StaticConversation? staticConversation;
      Response response = await get(
        Uri.parse(baseUrl + ApiEndpoints.staticConversation),
        headers: {
          "content-type": "application/json",
        },
      );
      // Can wrap the the response in the wrapper class as BaseResponse.fromJson() to send either data or error with msg
      // but the API response does not allow that right now
      // Can look at the baseReponse class at lib\network\models\base_response
      if (response.statusCode == 200) {
        staticConversation =
            StaticConversation.fromJson(jsonDecode(response.body));
        staticConversationCache = staticConversation;
        return staticConversation;
      } else {
        return null;
      }
    } catch (e) {
      //  log errors to any crash reporting tools
      log("Error fetching static conversation",
          name: "ConversationApiRepo",
          stackTrace: StackTrace.current,
          error: e);
      return null;
    }
  }
}
