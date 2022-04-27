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
      json['date_s'] as String,
      json['date_e'] as String,
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
      'date_s': instance.dateS,
      'date_e': instance.dateE,
      'synonym': instance.synonym,
      'works': instance.works,
    };
