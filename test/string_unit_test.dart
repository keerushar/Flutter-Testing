import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/main.dart';

void main() {
  test('reverse String', () {
    String initial = 'baglung';
    String reversed = reverseString(initial);
    expect(reversed, 'gnulgab');
  });

  test('length of String', () {
    String input = 'Goahead';
    int length = stringLength(input);
    expect(length, 7);
  });
}

