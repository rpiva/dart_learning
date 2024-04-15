import 'package:code_builder/code_builder.dart';

Method prepEqualityOperator({
  required String className,
  required List<String> fieldNames,
}) {
  String ifCheck = fieldNames.map((e) => '$e == other.$e').join(' &&');

  return Method((m) => m
    ..annotations.add(refer('override'))
    ..name = 'operator =='
    ..requiredParameters.addAll([
      Parameter((p) => p
        ..name = 'other'
        ..type = refer('Object'))
    ])
    ..returns = refer('bool')
    ..body = Code('''
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is $className &&
    $ifCheck
    ;
    '''));
}
