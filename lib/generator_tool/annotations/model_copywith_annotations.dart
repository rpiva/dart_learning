/// Annotation che abilita la creazione del metodo `copyWith`.
/// Il flag handleChanges indica che il metodo copyWith dovrà tenere conto
/// delle modifiche apportate all'oggetto mediante la compilazione dell'apposita
/// mappa
class CopyWith {
  final bool handleChanges;
  const CopyWith({
    this.handleChanges = false,
  });
}
