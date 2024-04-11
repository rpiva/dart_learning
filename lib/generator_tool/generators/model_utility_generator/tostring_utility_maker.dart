import 'package:code_builder/code_builder.dart';

/// Funzione che genera il metodo `toString` per una classe.
/// I parametri in ingresso sono:
/// className: il nome della classe
/// fieldNames: una lista dei nomi dei campi da riportare nel testo da generare
Method prepToString({
  required String className,
  required List<String> fieldNames,
}) {
  return Method((m) => m
    ..annotations.add(refer('override'))
    ..name = 'toString'
    ..returns = refer('String')
    ..body = Code('return "$className(${fieldNames.map((e) => '$e: ${'\$$e'}').join(', ')})";'));
}
