import 'package:build/build.dart';
import 'package:dart_learning/generator/copy_widh_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder copyWithBuilder(BuilderOptions options) => PartBuilder(
      [CopyWithGenerator()],
      ".copywith.dart",
      options: options,
    );