import 'package:test/test.dart';
import 'package:calculator/core/string_calculator.dart';

void main() {
  group('String Calculator TDD', () {
    test('Empty string should return 0', () {
      expect(add(""), equals(0));
    });
  });
}
