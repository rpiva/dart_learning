import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:dart_learning/generator_tool/annotations/model_copywith_annotations.dart';
import 'package:dart_learning/generator_tool/generator_utilities/typed_param.dart';
import 'package:dart_learning/generator_tool/generator_utilities/visitor.dart';
import 'package:source_gen/source_gen.dart';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

/// Generatore per l'annotazione `@CopyWith`.
/// Tutte le classi presenti nei file specificati nel build.yml che sono
/// annotate con `@CopyWith()` vengono trattate, le altre no
class ModelCopyWithGenerator extends GeneratorForAnnotation<CopyWith> {
  final BuilderOptions options;

  ModelCopyWithGenerator({required this.options});

  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    return _generateSource(element, annotation);
  }

  String _generateSource(Element element, ConstantReader annotation) {
    var visitor = ModelVisitor();
    element.visitChildren(visitor);

    // Recupero i metadati del costruttore di default
    final List<ConstructorElement> constructors =
        element.children.whereType<ConstructorElement>().toList();
    final ConstructorElement defaultConstructor =
        constructors.firstWhere((e) => e.name == "");

    // final List<FieldElement> fields =
    //     element.children.whereType<FieldElement>().toList();

    final defaultConstructorParameters = defaultConstructor.parameters.map(
      (e) => TypedParam(
        e.type,
        e.name,
      ),
    );

    final methodParameters = defaultConstructorParameters
        .where((e) => e.name != 'createDate' && e.name != 'writeDate');

    // final classFields = fields.map(
    //   (e) => TypedParam(
    //     e.type,
    //     e.name,
    //   ),
    // );

    final method = Method(
      (m) => m
        ..name = 'copyWith'
        ..returns = refer(element.displayName)
        ..optionalParameters.addAll(
          methodParameters.map((e) {
            return Parameter(
              (p) => p
                ..name = e.name
                ..type = refer(
                  '${e.type.getDisplayString(withNullability: false)}?',
                )
                ..named = true,
            );
          }),
        )
        ..body = Code(
          'return ${element.displayName}(${defaultConstructorParameters.map((e) {
            if (e.name == 'createDate') {
              return '${e.name}: ${e.name}';
            }
            if (e.name == 'writeDate') {
              return '${e.name}: DateTime.now()';
            }
            return '${e.name}: ${e.name} ?? this.${e.name}';
          }).join(', ')});',
        ),
    );

    // Tramite il package code_builder genero il mixing con il metodo copyWith
    final copyWithMixin = Mixin(
      (a) => a
        ..name = "${visitor.className}CopyWith"
        ..on = Reference("${visitor.className}ModelMixin")
        ..methods.add(method),
    );

    final emitter = DartEmitter.scoped();
    String generatedCode =
        DartFormatter().format('${copyWithMixin.accept(emitter)}');

    return '''
      $generatedCode
    ''';
  }
}

// className = ${visitor.className}
// fields = ${visitor.fields}
// metaData = ${visitor.metaData}
// methods = ${visitor.methods}
// handleChanges = ${annotation.read('handleChanges').boolValue}
// options entries = ${options.config.entries}
// defaultConstructorParameters = $defaultConstructor