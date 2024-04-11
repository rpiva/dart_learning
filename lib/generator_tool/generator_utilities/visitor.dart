import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';

/// Oggetto che raccoglie le informazioni di una classe Dart.
/// Viene utilizzata dai generatori per raccogliere gli elementi utili alla
/// costruzione di metodi e costruttori degli oggetti generati a partire da una
/// determinata classe Dart.
class ModelVisitor extends SimpleElementVisitor {
  late DartType className;
  Map<String, DartType> fields = {};
  Map<String, dynamic> metaData = {};
  Map<String, dynamic> methods = {};
  late ConstructorElement defaultConstructor;

  @override
  visitConstructorElement(ConstructorElement element) {
    className = element.type.returnType;
    defaultConstructor = element;
  }

  @override
  visitFieldElement(FieldElement element) {
    fields[element.name] = element.type;
    metaData[element.name] = element.metadata;
  }

  @override
  visitMethodElement(MethodElement element) {
    methods[element.name] = element.type;
  }
}
