part of 'payment.dart';

// extension PaymentToString on Payment {
//   String toString2() {
//     return 'Payment(code: $code, name: $name, description: ${description ?? 'pippo'})';
//   }
// }

// extension PaymentCopyWith2 on Payment {
//   Payment copyWith2({
//     String? code,
//     String? name,
//     String? description,
//   }) {
//     return Payment(
//       code: code ?? this.code,
//       name: name ?? this.name,
//       description: description ?? this.description,
//     );
//   }
// }

mixin PaymentCopyWith on PaymentBaseUtils {
  Payment copyWith({
    int? id,
    String? code,
    String? name,
    String? description,
  }) {
    return Payment(
      id: id ?? this.id,
      createDate: createDate,
      writeDate: DateTime.now(),
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
