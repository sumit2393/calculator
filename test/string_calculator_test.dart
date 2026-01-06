import 'package:test/test.dart';

void main() {
  group('String Calculator TDD', () {
    test('Empty string should return 0', () {
      expect(add(""), equals(0));
    });
  });
}
