import 'package:code_builder/code_builder.dart';

/// Funzione che genera il metodo `hashCode` per una classe. 
Method prepHashcode({
  required String className,
  required List<String> fieldNames,
}) {
  return Method((m) => m
    ..name = 'hashCode'
    ..annotations.add(refer('override'))
    ..returns = refer('int')
    ..type = MethodType.getter
    ..body = Code(" return super.hashCode ^ ${fieldNames.map((e) => '$e.hashCode ').join('^')};"));
}
