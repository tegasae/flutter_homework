import 'package:json_annotation/json_annotation.dart';

part 'log.g.dart';

@JsonSerializable(explicitToJson: true)
class LogRecord {
  final int id;
  final String date;
  @JsonKey(name: 'user_id')
  final int userId;
  final String name;
  @JsonKey(name: 'client_id')
  final int clientId;
  final String client;
  @JsonKey(name: 'time_s')
  final DateTime timeS;
  @JsonKey(name: 'time_e',defaultValue: "")
  final String timeE;
  final String synonym;

  LogRecord(this.id, this.date, this.userId, this.name, this.clientId,
      this.client, this.timeS, this.timeE, this.synonym);
  factory LogRecord.fromJson(Map<String, dynamic> json) => _$LogRecordFromJson(json);
  Map<String, dynamic> toJson() => _$LogRecordToJson(this);
}

//{"id": 3215, "date": "2022-07-10 18:09:38", "user_id": 7, "name": "sae1", "client_id": 0, "client": "", "time_s": "2022-07-10 18:09:38", "time_e": "2022-07-10 18:09:46", "synonym": "Vfbbhb", "works": "Dfbhgvv"}