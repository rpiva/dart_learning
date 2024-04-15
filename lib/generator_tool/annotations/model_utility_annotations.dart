/// Classe usata come annotazione per indicare che per la classe annotata deve
/// essere creato il mixin delle utility.
///
/// Tramite i parametri appositi è possibile decidere quali funzioni
/// sovrascrivere.
///
/// Nel caso di override dell'operatore di ugualianza, di default la proprietà
/// "id" viene usata per il confronto; questo permette di non specificare nessun
/// altro campo di confronto mediante l'apposita annotazione.
class UtilityMethods {
  final bool overrideToString;
  final bool overrideEquality;
  final bool overrideHashCode;
  final bool idInEquality;
  final bool idInHashCode;

  const UtilityMethods({
    this.overrideToString = false,
    this.overrideEquality = false,
    this.idInEquality = true,
    this.idInHashCode = true,
    this.overrideHashCode = false,
  });
}

/// Annotazione che serve per indicare che il valore della proprietà annotata
/// deve essere incluso nella rappresentazione in stringa della classe.
class ToStringField {
  const ToStringField();
}

/// Annotazione che serve per indicare che la proprietà annotata deve essere
/// usata per la verifica dell'ugualianza
class EqualityField {
  const EqualityField();
}

/// Annotazione che serve per indicare che la proprietà annotata deve essere
/// usata per il calcolo del codice hash della classe.
class HashCodeField {
  const HashCodeField();
}
