import 'package:json_annotation/json_annotation.dart';

part 'chat_message.g.dart';

@JsonSerializable()
class ChatMsg {
  String? message;
  String? user;

  ChatMsg({required this.message, required this.user});

  factory ChatMsg.fromJson(Map<String, dynamic> json) =>
      _$ChatMsgFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMsgToJson(this);
}
