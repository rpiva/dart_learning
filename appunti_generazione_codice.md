# Appunti per la creazione di un generatore di codice

## Link utili

<https://invertase.io/blog/using-code-generation-to-create-a-scalable-and-reliable-codebase>

<https://medium.com/@JalalOkbi/kickstart-your-code-generation-tool-for-flutter-e89c0555f25d#:~:text=The%20main%20components%20in%20are,building%20your%20generated%20code%20fluently>.

## Packages necessari per il progetto

- build: set di oggetti e funzioni utili per la gestione della creazione di codice come analizzatore di condice e scrittore di file
- build_runner (dev_dependencies): permette l'esecuzione del builder in base alla configurazione impostata nel file build.yaml
- source_gen: set di oggetti e funzioni che estendono builder e permettono di leggere
- analyzer: set di oggetti e funzioni che permettono di capire il contenuto di un file Dart
- code_builder: set di oggetti e funzioni che permettono di rappresentare oggetti Dart in modo programmatico, questi poi potranno essere convertiti in testo e scritti nei file dal package Builder

## Annotations

Le annotations sono classi con un costruttore const (possono prendere in ingresso dei parametri). Le annotations servono per aggiungere metadati ad un oggetto Dart, tali metadati vengono interpretati da analyzer e possono essere utilizzati per parametrizzare la un generatore di codice.

## build e build_runner

build e il relativo build_runner grazie alla configurazione trovata nel file build.yaml permettono eseguire funzioni di generazione di codice relative ad uno specifico file sorgente (.dart, .json, .yaml, .xml o altro) presente nel file system in una specifica directory o una serie di directory o anche in base a parte del nome, il risultato dell'elaborazione di tali file sarà a sua volta in file del tipo\nome specificato sempre nel build.yml. Grazie a Build per esempio è possibile generare file html partendo da un file .md, oppure generare codice Dart partendo da un file .json.

## build.yml

```yaml
builders:
  fun_generator:
    #Where your builder factory is defined
    import: "package:fun_generator/builder.dart"
    builder_factories: ["funBuilder"]
    # <String, List<String>>{} inputs and outputs
    build_extensions: {".dart": [".fun.dart"]}
    auto_apply: dependents
    #Whether to build directly to the source or to the cache (needed when another builder will take output from this builder)
    build_to: source
    applies_builders: ["source_gen|combining_builder"]
```
