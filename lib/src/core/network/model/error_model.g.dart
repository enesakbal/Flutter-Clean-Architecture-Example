// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkErrorModel _$NetworkErrorModelFromJson(Map<String, dynamic> json) =>
    NetworkErrorModel(
      statusCode: json['status_code'] as int?,
      statusMessage: json['status_message'] as String?,
    );

Map<String, dynamic> _$NetworkErrorModelToJson(NetworkErrorModel instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };
