import 'package:analyzer/dart/element/element.dart';

/// Funzione che restituisce la lista delle proprietà annotate con la annotazione
/// passata come parametro
/// Per ogni campo vengono passati eventuali valori presenti nell'annotazione
Map<String, dynamic> getFieldsByAnnotation({
  required String annotationName,
  required Map<String, dynamic> fieldsInfo,
}) {
  Map<String, dynamic> returnFields = {};
  for (String key in fieldsInfo.keys) {
    for (ElementAnnotation annotation in fieldsInfo[key]['annotations'] as List<ElementAnnotation>) {
      if (annotation.element?.displayName == annotationName) {
        returnFields[key] = {
          annotation: annotationName,
          'type': fieldsInfo[key]['type'].name,
        };
      }
    }
  }
  return returnFields;
}
