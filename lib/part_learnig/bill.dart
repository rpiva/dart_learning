import 'package:dart_learning/models/bill_header/bill_header.dart';
import 'package:dart_learning/models/bill_item/bill_item.dart';
import 'package:dart_learning/models/payment/payment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bill.g.dart';

@JsonSerializable()
class Bill {
  final BillHeader header;
  final List<BillItem> items;
  final Payment? payment;

  Bill({required this.header, required this.items, this.payment});

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);

  Map<String, dynamic> toJson() => _$BillToJson(this);

  @override
  String toString() {
    return 'Bill($header - [${items.length}])';
  }
}
