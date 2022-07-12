import 'package:json_annotation/json_annotation.dart';

part 'log.g.dart';

@JsonSerializable(explicitToJson: true)
class LogPreview {
  final int id;
  final String date;
  final int user_id;
  final String name;
  final int client_id;
  final String client;
  final String time_s;
  final String time_e;
  final String synonym;


  LogPreview(this.id, this.date, this.user_id, this.name, this.client_id,
      this.client, this.time_s, this.time_e, this.synonym);

  factory LogPreview.fromJson(Map<String, dynamic> json) =>
      _$LogPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$LogPreviewToJson(this);
}

//{"id": 3215, "date": "2022-07-10 18:09:38", "user_id": 7, "name": "sae1", "client_id": 0, "client": "", "time_s": "2022-07-10 18:09:38", "time_e": "2022-07-10 18:09:46", "synonym": "Vfbbhb", "works": "Dfbhgvv"}