import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Basic Unit Test', () {
    test('2 + 2 should equal 4', () {
      final result = 2 + 2;
      expect(result, 4);
    });

    test('String should not be empty', () {
      final text = 'Flutter';
      expect(text.isNotEmpty, true);
    });
  });
}
