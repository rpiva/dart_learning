// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) => Bill(
      header: BillHeader.fromJson(json['header'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => BillItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      payment: json['payment'] == null
          ? null
          : Payment.fromJson(json['payment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'header': instance.header,
      'items': instance.items,
      'payment': instance.payment,
    };
