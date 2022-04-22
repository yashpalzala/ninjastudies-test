import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  @JsonKey(name: "success")
  final bool? response;

  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "result")
  final T? payload;

  const BaseResponse({this.response, this.message, this.payload});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object Function(T? value) toJsonT,
  ) =>
      _$BaseResponseToJson(this, toJsonT);
}
