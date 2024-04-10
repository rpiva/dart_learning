/// Classe che definisce i campi base di tutti i modelli di dati.
abstract class BaseModel {
  final int? id;
  final DateTime createDate;
  final DateTime writeDate;

  BaseModel({
    this.id,
    required this.createDate,
    required this.writeDate,
  });
}
