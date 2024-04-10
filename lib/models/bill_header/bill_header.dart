import 'package:json_annotation/json_annotation.dart';

part 'bill_header.g.dart';

@JsonSerializable()
class BillHeader {
  final String number;
  final DateTime bookingDate;
  final double total;

  BillHeader({
    required this.number,
    required this.bookingDate,
    required this.total,
  });

  factory BillHeader.fromJson(Map<String, dynamic> json) =>
      _$BillHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$BillHeaderToJson(this);

  @override
  String toString() {
    return 'bill $number - ${bookingDate.toString()} - $total';
  }
}
