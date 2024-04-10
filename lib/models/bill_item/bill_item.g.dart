// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillItem _$BillItemFromJson(Map<String, dynamic> json) => BillItem(
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
    )..price = (json['price'] as num).toDouble();

Map<String, dynamic> _$BillItemToJson(BillItem instance) => <String, dynamic>{
      'item': instance.item,
      'quantity': instance.quantity,
      'price': instance.price,
    };
