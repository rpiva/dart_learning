// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// ModelUtilityGenerator
// **************************************************************************

mixin ItemUtility on ItemModelMixin {
  @override
  String toString() {
    return "Item(code: $code, name: $name)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is Item &&
        id == other.id &&
        code == other.code &&
        name == other.name &&
        price == other.price;
  }

  @override
  int get hashCode {
    return super.hashCode ^ id.hashCode ^ code.hashCode ^ name.hashCode;
  }
}
