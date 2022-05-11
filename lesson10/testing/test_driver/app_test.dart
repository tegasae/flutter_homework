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
    //Ищем поле email, заполняем его, проверяем, что данные появились
    test('Test email',() async {
      await driver.tap(finderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('email@1111.com');
      await driver.waitFor(find.text('email@1111.com'));


    });
    //Ищем поле phone, заполняем его, проверям, что данные появились
    test('Test phone',() async {
      await driver.tap(finderPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('1234567890');
      await driver.waitFor(find.text('1234567890'));
    });

    //Отправляем данные, проверяем, что появилось сообщение об успешном входе
    test('Test send', () async {
      await driver.tap(finderSend);
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
    final SerializableFinder finderLoginOrRegistration=find.byValueKey('loginOrRegistration');
    final SerializableFinder finderFirstName=find.byValueKey('firstName');
    final SerializableFinder finderLastName=find.byValueKey('lastName');
    final SerializableFinder finderEmail=find.byValueKey('email');
    final SerializableFinder finderPhone=find.byValueKey('phone');
    final SerializableFinder finderSend=find.byValueKey('send');

    //Переключаемся на экран Register
    //Вводим данные в firstName, проверяем, что они появились
    test('Test First Name',() async {
      await driver.tap(finderLoginOrRegistration);
      await driver.tap(finderFirstName);
      await driver.waitFor(find.text(''));
      await driver.enterText('name');
      await driver.waitFor(find.text('name'));
    });

    //Вводим данные в lastName, проверяем, что они появлись
    test('Test Last Name',() async {
      await driver.tap(finderLastName);
      await driver.waitFor(find.text(''));
      await driver.enterText('name');
      await driver.waitFor(find.text('name'));
    });

    //Вводим данные в phone, проверяем, что они появились
    test('Test Phone',() async {
      await driver.tap(finderPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('1234567890');
      await driver.waitFor(find.text('1234567890'));
    });

    //Вводим данные в email, проверяем, что они появились
    test('Test Email',() async {
      await driver.tap(finderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('111@1111.ru');
      await driver.waitFor(find.text('111@1111.ru'));
    });

    //Отправляем данные, проверяем, что регистрация прошла успешно
    test('Test send', () async {
      await driver.tap(finderSend);
      final SerializableFinder finderRegistration=find.text('Вы успешно зарегистрировались');
      expect(await driver.getText(finderRegistration),'Вы успешно зарегистрировались');
    });
  });
}
