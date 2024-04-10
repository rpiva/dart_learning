import 'package:dart_learning/models/payment/payment.dart';
import 'package:test/test.dart';

void main() {
  late Payment payment;
  late DateTime dateTest;

  setUp(() {
    dateTest = DateTime.now();
    payment = Payment(
      code: '01',
      name: 'Contante',
      createDate: dateTest,
      writeDate: dateTest,
    );
  });

  test('payment test', () {
    expect(payment.code, '01');
    expect(payment.name, 'Contante');
    expect(payment.toString(), 'Payment(code: 01, name: Contante)');
  });

  test('payment copywith', () {
    // print("Create pre; ${payment.createDate}");
    // print("Write pre; ${payment.writeDate}");
    payment = payment.copyWith(code: '02', name: 'Carta di credito');
    expect(payment.code, '02');
    expect(payment.name, 'Carta di credito');
    // print("Create post; ${payment.createDate}");
    // print("Write post; ${payment.writeDate}");
  });

  test('payment copywith dates', () {
    payment = payment.copyWith(code: '03', name: 'Prepagato');
    expect(payment.code, '03');
    expect(payment.name, 'Prepagato');
    expect(payment.createDate, dateTest);
    expect(payment.writeDate != dateTest, true);
  });

  test('table name ', () {
    expect(payment.tableName, 'payment');
  });
}
