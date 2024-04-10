import 'package:dart_learning/models/payment/payment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bill_payment.g.dart';

@JsonSerializable()
class BillPayment {
  final Payment payment;
  final double amount;

  BillPayment({required this.payment, required this.amount});

  factory BillPayment.fromJson(Map<String, dynamic> json) =>
      _$BillPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$BillPaymentToJson(this);

  @override
  String toString() {
    return 'BillPayment(payment: $payment, amount: $amount)';
  }
}
