// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMsg _$ChatMsgFromJson(Map<String, dynamic> json) => ChatMsg(
      message: json['message'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$ChatMsgToJson(ChatMsg instance) => <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };
