import 'package:dart_learning/generator/annotations/copy_with_annotation.dart';
import 'package:dart_learning/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'item.g.dart';

@JsonSerializable()
@Immutable()
@CopyWith()
class Item extends BaseModel {
  final String code;
  final String name;
  final double price;

  Item({
    super.id,
    required super.createDate,
    required super.writeDate,
    required this.code,
    required this.name,
    required this.price,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  String toString() {
    return 'Item($code - $name)';
  }
}
