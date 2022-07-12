// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogPreview _$LogPreviewFromJson(Map<String, dynamic> json) => LogPreview(
      json['id'] as int,
      json['date'] as String,
      json['user_id'] as int,
      json['name'] as String,
      json['client_id'] as int,
      json['client'] as String,
      json['time_s'] as String,
      json['time_e'] as String,
      json['synonym'] as String,
    );

Map<String, dynamic> _$LogPreviewToJson(LogPreview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'user_id': instance.user_id,
      'name': instance.name,
      'client_id': instance.client_id,
      'client': instance.client,
      'time_s': instance.time_s,
      'time_e': instance.time_e,
      'synonym': instance.synonym,
    };
