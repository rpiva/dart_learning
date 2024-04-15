import 'package:dart_learning/generator_tool/annotations/model_copywith_annotations.dart';
import 'package:dart_learning/generator_tool/annotations/model_mixin_annotations.dart';
import 'package:dart_learning/generator_tool/annotations/model_utility_annotations.dart';
import 'package:dart_learning/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'item.g.dart';
part 'item.mixin.dart';
part 'item.utility.dart';
part 'item.copywith.dart';

@WithModelMixin()
@UtilityMethods(
    overrideToString: true, overrideEquality: true, overrideHashCode: true, idInEquality: true, idInHashCode: true)
@CopyWith(handleChanges: true)
@JsonSerializable()
@Immutable()
class Item extends BaseModel with ItemModelMixin, ItemCopyWith, ItemUtility {
  @HashCodeField()
  @ToStringField()
  @EqualityField()
  @override
  final String code;

  @HashCodeField()
  @EqualityField()
  @ToStringField()
  @override
  final String name;

  @EqualityField()
  @JsonKey(name: 'price', disallowNullValue: true)
  @override
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
}
