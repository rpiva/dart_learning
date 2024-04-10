// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as int?,
      createDate: DateTime.parse(json['createDate'] as String),
      writeDate: DateTime.parse(json['writeDate'] as String),
      code: json['code'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'createDate': instance.createDate.toIso8601String(),
      'writeDate': instance.writeDate.toIso8601String(),
      'code': instance.code,
      'name': instance.name,
      'price': instance.price,
    };
