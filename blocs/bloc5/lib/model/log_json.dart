
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
  @JsonKey(name: 'date_s')
  final String dateS;
  @JsonKey(name:'date_e')
  final String dateE;
  final String synonym;
  final String works;

  LogRecord(this.id, this.date, this.userID, this.name, this.clientID,
      this.client, this.dateS, this.dateE, this.synonym, this.works);
  factory LogRecord.fromJson(Map<String,dynamic> json)=>_$LogRecordFromJson(json);
  Map<String,dynamic> toJson() => _$LogRecordToJson(this);
}