import 'package:dart_learning/models/item/item.dart';
import 'package:test/test.dart';

void main() {
  late Item item;
  late DateTime dateTest;

  setUp(() {
    dateTest = DateTime.now();
    item = Item(
      code: '01',
      name: 'Pizza',
      price: 1.1,
      createDate: dateTest,
      writeDate: dateTest,
    );
  });

  test('item test', () {
    expect(item.code, '01');
    expect(item.name, 'Pizza');
    expect(item.toString(), 'Item(code: 01, name: Pizza)');
  });

  test('item copywith', () {
    // print("Create pre; ${item.createDate}");
    // print("Write pre; ${item.writeDate}");
    item = item.copyWith(code: '02', name: 'Pasta');
    expect(item.code, '02');
    expect(item.name, 'Pasta');
    // print("Create post; ${item.createDate}");
    // print("Write post; ${item.writeDate}");
  });

  test('item copywith dates', () {
    item = item.copyWith(code: '03', name: 'Torta');
    expect(item.code, '03');
    expect(item.name, 'Torta');
    expect(item.createDate, dateTest);
    expect(item.writeDate != dateTest, true);
  });
}
