import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_learning/generator_tool/annotations/model_utility_annotations.dart';
import 'package:dart_learning/generator_tool/generator_utilities/get_fields_by_annotation.dart';
import 'package:dart_learning/generator_tool/generator_utilities/visitor.dart';
import 'package:dart_learning/generator_tool/generators/model_utility_generator/equality_operator_maker.dart';
import 'package:dart_learning/generator_tool/generators/model_utility_generator/hashcode_utility_maker.dart';
import 'package:dart_learning/generator_tool/generators/model_utility_generator/tostring_utility_maker.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';

/// Generatore di un mixin che contiene gli override dei metodi:
/// toString
/// hashCode
/// operator ==
class ModelUtilityGenerator extends GeneratorForAnnotation<UtilityMethods> {
  final BuilderOptions options;

  ModelUtilityGenerator({required this.options});

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    var visitor = ModelVisitor();
    element.visitChildren(visitor);

    // Recupero le informazioni dall'annotazione della classe
    Map<String, dynamic> fieldsInfo = visitor.fieldsInfo();

    bool overrideToString = annotation.objectValue.getField('overrideToString')?.toBoolValue() ?? false;
    bool overrideEquality = annotation.objectValue.getField('overrideEquality')?.toBoolValue() ?? false;
    bool idInEquality = annotation.objectValue.getField('idInEquality')?.toBoolValue() ?? true;
    bool overrideHashCode = annotation.objectValue.getField('overrideHashCode')?.toBoolValue() ?? false;

    // Genero le liste dei nomi proprietà in base alle annotazioni delle proprietà

    Map<String, dynamic> toStringFieldNamesMap = getFieldsByAnnotation(
      annotationName: 'ToStringField',
      fieldsInfo: fieldsInfo,
    );
    Map<String, dynamic> equalityFieldNamesMap = getFieldsByAnnotation(
      annotationName: 'EqualityField',
      fieldsInfo: fieldsInfo,
    );
    Map<String, dynamic> hashCodeFieldNamesMap = getFieldsByAnnotation(
      annotationName: 'HashCodeField',
      fieldsInfo: fieldsInfo,
    );
    List<String> toStringFieldNames = [...toStringFieldNamesMap.keys];
    List<String> equalityFieldNames = [if (idInEquality) ...['id'], ...equalityFieldNamesMap.keys];
    List<String> hashCodeFieldNames = ['id', ...hashCodeFieldNamesMap.keys];

    final modelMixin = Mixin(
      (m) => m
        // ..docs.addAll([
        //   'Mixin per la classe ${visitor.className} dove vengono implementati ',
        //   'i metodi toString, hashCode l''operatore di ugualianza',
        // ])
        ..name = "${visitor.className}Utility"
        ..on = Reference("${visitor.className}ModelMixin")
        // Lista dei getter per i campi
        ..methods.addAll([
          if (overrideToString) ...[
            prepToString(
              className: visitor.className.getDisplayString(
                withNullability: false,
              ),
              fieldNames: toStringFieldNames,
            ),
          ],
          if (overrideEquality) ...[
            prepEqualityOperator(
              className: visitor.className.getDisplayString(
                withNullability: false,
              ),
              fieldNames: equalityFieldNames,
            ),
          ],
          if (overrideHashCode) ...[
            prepHashcode(
              className: visitor.className.getDisplayString(
                withNullability: false,
              ),
              fieldNames: hashCodeFieldNames,
            ),
          ],
        ]),
    );

    final emitter = DartEmitter.scoped();
    String generatedCode = DartFormatter().format('${modelMixin.accept(emitter)}');

    return '''
      $generatedCode
    ''';
  }
}
