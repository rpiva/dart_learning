import 'package:dart_learning/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'payment.g.dart';
part 'payment.copywith.dart';
part 'payment.utils.dart';

@JsonSerializable()
@Immutable()
class Payment extends BaseModel
    with PaymentBaseUtils, PaymentUtils, PaymentCopyWith {
  @override
  final String code;
  @override
  final String name;
  @override
  final String? description;

  Payment({
    super.id,
    required super.createDate,
    required super.writeDate,
    required this.code,
    required this.name,
    this.description,
  });

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);

}
