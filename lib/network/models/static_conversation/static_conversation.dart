import 'package:json_annotation/json_annotation.dart';

part 'static_conversation.g.dart';

@JsonSerializable(explicitToJson: true)
class StaticConversation {
  late List<ConversationEntity> restaurant;

  StaticConversation({required this.restaurant});

  factory StaticConversation.fromJson(Map<String, dynamic> json) =>
      _$StaticConversationFromJson(json);

  Map<String, dynamic> toJson() => _$StaticConversationToJson(this);
}

@JsonSerializable()
class ConversationEntity {
  late String bot;
  late String human;

  ConversationEntity({required this.bot, required this.human});

  factory ConversationEntity.fromJson(Map<String, dynamic> json) =>
      _$ConversationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationEntityToJson(this);
}
