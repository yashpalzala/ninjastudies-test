import 'package:json_annotation/json_annotation.dart';

enum MsgAnalyzeReport {
  @JsonValue("wrong_msg")
  wrongMsg,
  @JsonValue("missed_word")
  missedWord,
  @JsonValue("wrong_word")
  wrongWord
}
