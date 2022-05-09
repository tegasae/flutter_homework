// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    // TODO: write tests
    final SerializableFinder finderEmail=find.byValueKey('email');
    final SerializableFinder finderPhone=find.byValueKey('phone');
    final SerializableFinder finderSend=find.byValueKey('send');
    test('Test email',() async {
      await driver.tap(finderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('email@1111.com');
      await driver.waitFor(find.text('email@1111.com'));


    });
    test('Test phone',() async {
      await driver.tap(finderPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('1234567890');
      await driver.waitFor(find.text('1234567890'));
    });

    test('Test send',() async {
      await driver.tap(finderSend);
    });
    test('Test success', () async {
      final SerializableFinder findWelcome=find.text('Добро пожаловать');
      expect(await driver.getText(findWelcome), 'Добро пожаловать' );
    });
  });

  group('Register form tests', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    // TODO: write tests
  });
}
