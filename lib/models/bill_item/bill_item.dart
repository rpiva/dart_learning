import 'package:dart_learning/models/item/item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bill_item.g.dart';

@JsonSerializable()
class BillItem {
  final Item item;
  final int quantity;
  late final double price;

  BillItem({required this.item, required this.quantity}) : price = item.price;

  factory BillItem.fromJson(Map<String, dynamic> json) =>
      _$BillItemFromJson(json);

  Map<String, dynamic> toJson() => _$BillItemToJson(this);

  @override
  String toString() {
    return 'BillItem(${item.code} - ${item.name}: $quantity x $price = $itemTotal)';
  }

  double get itemTotal => quantity * price;
}
