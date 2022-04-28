
import 'package:json_annotation/json_annotation.dart';

part 'log_json.g.dart';

@JsonSerializable()
class LogRecord {
  final int id;
  final String date;
  @JsonKey(name:'user_id')
  final int userID;
  final String name;
  @JsonKey(name:'client_id')
  final int clientID;
  final String client;
  @JsonKey(name: 'time_s')
  final String timeS;
  @JsonKey(name:'time_e')
  final String timeE;
  final String synonym;
  final String works;

  LogRecord(this.id, this.date, this.userID, this.name, this.clientID,
      this.client, this.timeS, this.timeE, this.synonym, this.works);
  factory LogRecord.fromJson(Map<String,dynamic> json)=>_$LogRecordFromJson(json);
  Map<String,dynamic> toJson() => _$LogRecordToJson(this);
}