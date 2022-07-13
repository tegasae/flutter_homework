// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

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
      DateTime.parse(json['time_s'] as String),
      json['time_e'] as String? ?? '',
      json['synonym'] as String,
    );

Map<String, dynamic> _$LogRecordToJson(LogRecord instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'user_id': instance.userId,
      'name': instance.name,
      'client_id': instance.clientId,
      'client': instance.client,
      'time_s': instance.timeS.toIso8601String(),
      'time_e': instance.timeE,
      'synonym': instance.synonym,
    };
