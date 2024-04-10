// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      id: json['id'] as int?,
      createDate: DateTime.parse(json['createDate'] as String),
      writeDate: DateTime.parse(json['writeDate'] as String),
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'createDate': instance.createDate.toIso8601String(),
      'writeDate': instance.writeDate.toIso8601String(),
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
    };
