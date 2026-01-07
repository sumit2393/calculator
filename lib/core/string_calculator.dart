int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }
  String delimiter = ',';
  String numbersPart = numbers;
  // Handle custom delimiter
  if (numbers.startsWith('//')) {
    final lines = numbers.split('\n');
    delimiter = lines[0].substring(2);
    numbersPart = lines[1];
  }

  // Support newline delimiter
  numbersPart = numbersPart.replaceAll('\n', delimiter);

  final values = numbersPart.split(delimiter).map((e) => int.parse(e)).toList();

  return values.reduce((a, b) => a + b);
}
