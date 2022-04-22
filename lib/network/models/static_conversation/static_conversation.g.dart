// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'static_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaticConversation _$StaticConversationFromJson(Map<String, dynamic> json) =>
    StaticConversation(
      restaurant: (json['restaurant'] as List<dynamic>)
          .map((e) => ConversationEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StaticConversationToJson(StaticConversation instance) =>
    <String, dynamic>{
      'restaurant': instance.restaurant.map((e) => e.toJson()).toList(),
    };

ConversationEntity _$ConversationEntityFromJson(Map<String, dynamic> json) =>
    ConversationEntity(
      bot: json['bot'] as String,
      human: json['human'] as String,
    );

Map<String, dynamic> _$ConversationEntityToJson(ConversationEntity instance) =>
    <String, dynamic>{
      'bot': instance.bot,
      'human': instance.human,
    };
