import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Integration test', () {
    FlutterDriver? driver;

    setUpAll(() async {
      //Setup instance for driver
      driver = await FlutterDriver.connect();
      print('Instance allocated: $driver');
    });
    tearDownAll(() {
      if (driver != null) {
        driver!.close();
        print('Instance released');
      }
    });
    var textField = find.byType("TextField");
    var button = find.text('Compute');
    var reverse = find.text('uzruG');
    var length = find.text('5');

    test('Compute the String', () async {
      await Future.delayed(const Duration(seconds: 5));
      driver!.tap(textField);
      await Future.delayed(const Duration(seconds: 5));
      await driver!.enterText('Company');
      await Future.delayed(const Duration(seconds: 5));
       driver!.waitForAbsent(reverse);
      await driver!.waitForAbsent(length);
       driver!.tap(button);
      await Future.delayed(const Duration(seconds: 5));
       driver!.waitFor(reverse);
       driver!.waitFor(length);
      await driver!.waitUntilNoTransientCallbacks();
    });
  });
}
