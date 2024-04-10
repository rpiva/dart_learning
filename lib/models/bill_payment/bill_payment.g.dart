// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillPayment _$BillPaymentFromJson(Map<String, dynamic> json) => BillPayment(
      payment: Payment.fromJson(json['payment'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$BillPaymentToJson(BillPayment instance) =>
    <String, dynamic>{
      'payment': instance.payment,
      'amount': instance.amount,
    };
