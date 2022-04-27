// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogRecord _$LogRecordFromJson(Map<String, dynamic> json) => LogRecord(
      json['id'] as int,
      json['date'] as String,
      json['user_id'] as int,
      json['name'] as String,
      json['client_id'] as int,
      json['client'] as String,
      json['time_s'] as String,
      json['time_e'] as String,
      json['synonym'] as String,
      json['works'] as String,
    );

Map<String, dynamic> _$LogRecordToJson(LogRecord instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'user_id': instance.userID,
      'name': instance.name,
      'client_id': instance.clientID,
      'client': instance.client,
      'time_s': instance.timeS,
      'time_e': instance.timeE,
      'synonym': instance.synonym,
      'works': instance.works,
    };
