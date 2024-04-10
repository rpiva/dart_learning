part of 'payment.dart';

mixin PaymentBaseUtils on BaseModel {
  String get code;
  String get name;
  String? get description;

  String get tableName => 'payment';
}

mixin PaymentUtils on PaymentBaseUtils {
  @override
  String toString() {
    return 'Payment(code: $code, name: $name)';
  }
}
