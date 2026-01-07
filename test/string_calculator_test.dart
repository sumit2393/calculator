import 'package:test/test.dart';
import 'package:calculator/core/string_calculator.dart';

void main() {
  group('String Calculator TDD', () {
    test('Empty string should return 0', () {
      expect(add(""), equals(0));
    });

    test('Single number should return the number', () {
      expect(add("1"), equals(1));
    });

    test('Two numbers separated by comma', () {
      expect(add("1,5"), equals(6));
    });

    test('Multiple numbers', () {
      expect(add("1,2,3,4"), equals(10));
    });

    test('New line as delimiter', () {
      expect(add("1\n2,3"), equals(6));
    });

    test('Custom delimiter', () {
      expect(add("//;\n1;2"), equals(3));
    });

    // Negative numbers should throw exception
    test('Negative numbers should throw exception', () {
      expect(
        () => add("1,-2"),
        throwsA(
          predicate(
            (e) => e.toString().contains("negative numbers not allowed -2"),
          ),
        ),
      );
    });
  });
  // Additional test for multiple negative numbers
  test('Multiple negative numbers should show all', () {
    expect(
      () => add("1,-2,-3"),
      throwsA(
        predicate(
          (e) => e.toString().contains("negative numbers not allowed -2,-3"),
        ),
      ),
    );
  });
}
