import 'package:build/build.dart';
import 'package:dart_learning/generator_tool/generators/model_copywidh_generator/model_copywidh_generator.dart';
import 'package:dart_learning/generator_tool/generators/model_mixin_generator/model_mixin_generator.dart';
import 'package:dart_learning/generator_tool/generators/model_utility_generator/model_utility_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder modelMixinBuilder(BuilderOptions options) => PartBuilder(
      [ModelMixinGenerator(options: options)], // Generatore
      ".mixin.dart", // estensione del file generato
      options: options,
    );

Builder modelUtilityBuilder(BuilderOptions options) => PartBuilder(
      [ModelUtilityGenerator(options: options)],
      '.utility.dart',
      options: options,
    );

Builder modelCopyWithBuilder(BuilderOptions options) => PartBuilder(
      [ModelCopyWithGenerator(options: options)], // Generatore
      ".copywith.dart", // estensione del file generato
      options:
          options, // Eventuali opzioni lette dal target nel file pubspec.yaml
    );
