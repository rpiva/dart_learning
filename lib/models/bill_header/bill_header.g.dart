// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillHeader _$BillHeaderFromJson(Map<String, dynamic> json) => BillHeader(
      number: json['number'] as String,
      bookingDate: DateTime.parse(json['bookingDate'] as String),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$BillHeaderToJson(BillHeader instance) =>
    <String, dynamic>{
      'number': instance.number,
      'bookingDate': instance.bookingDate.toIso8601String(),
      'total': instance.total,
    };
