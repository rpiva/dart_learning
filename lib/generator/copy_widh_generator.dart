import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:dart_learning/generator/annotations/copy_with_annotation.dart';
import 'package:source_gen/source_gen.dart';

class CopyWithGenerator extends GeneratorForAnnotation<CopyWith> {
  @override
  FutureOr<String> generate(
    LibraryReader oldLibrary,
    BuildStep buildStep,
  ) async {
    throw UnimplementedError();
  }

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    // TODO: implement generateForAnnotatedElement
    throw UnimplementedError();
  }
}
