import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_learning/generator_tool/annotations/model_mixin_annotations.dart';
import 'package:dart_learning/generator_tool/generator_utilities/visitor.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';

class ModelUtilityGenerator extends GeneratorForAnnotation<WithModelMixin> {
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
    final Iterable<FieldElement> fields = element.children.whereType<FieldElement>();

    final modelMixin = Mixin((m) => m
          ..name = "${visitor.className}Utility"
          ..on = Reference("${visitor.className}ModelMixin")
        // Lista dei getter per i campi
        // ..methods.addAll(getters),
        );

    final emitter = DartEmitter.scoped();
    String generatedCode = DartFormatter().format('${modelMixin.accept(emitter)}');

    return '''
      $generatedCode


      // className = ${visitor.className}
      // fields = ${visitor.fields}
      // metaData = ${visitor.metaData}
      // methods = ${visitor.methods}
      // options entries = ${options.config.entries}
    ''';
  }
}
