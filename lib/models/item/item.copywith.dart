// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// ModelCopyWithGenerator
// **************************************************************************

mixin ItemCopyWith on ItemModelMixin {
  Item copyWith({
    int? id,
    String? code,
    String? name,
    double? price,
  }) {
    return Item(
        id: id ?? this.id,
        createDate: createDate,
        writeDate: DateTime.now(),
        code: code ?? this.code,
        name: name ?? this.name,
        price: price ?? this.price);
  }
}
