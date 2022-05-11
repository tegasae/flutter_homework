import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/views/login_view.dart';

void main() {
  Finder loginOrRegistration=find.byKey(const Key('loginOrRegistration'));
  Finder email=find.byKey(const Key('email'));
  Finder phone=find.byKey(const Key('phone'));
  Finder send=find.byKey(const Key('send'));
  Finder firstName=find.byKey(const Key('firstName'));
  Finder lastName=find.byKey(const Key('lastName'));


  testWidgets('Login View Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginView()));



    //Поиск видежтов на экране Login
    expect(loginOrRegistration, findsOneWidget);
    expect(email, findsOneWidget);
    expect(phone,findsOneWidget);
    expect(send,findsOneWidget);

    //Проверка, что при пустых полях ввода email и phone выводятся сообщения о необходимости ввода
    await tester.tap(send);
    await tester.pump();
    expect(find.text('Введите email'), findsOneWidget);
    expect(find.text('Введите телефон'), findsOneWidget);

    //Ввод некорректных данных в email и phone, проверка, что в выводится ссобщение о некорректности email
    //и что в поле phone некорректные данные не отобразились
    await tester.enterText(email,'text');
    await tester.enterText(phone,'not digits');
    await tester.tap(send);
    await tester.pump();
    expect(find.text('Поле email заполнено не корректно'),findsOneWidget);
    expect(find.text('not digits'),findsNothing);

    //ввод корректных данных и провера появления надписи об успешном логине
    await tester.enterText(email,'11@111.com');
    await tester.enterText(phone, '1234567');
    await tester.tap(send);
    await tester.pump();
    expect(find.text('Добро пожаловать'),findsOneWidget);

    //переключение на экран Register
    //await tester.pumpWidget(const MaterialApp(home: LoginView()));
    await tester.tap(loginOrRegistration);
    await tester.pump();

    //Проверка, что поля firstName, lastName, phone и email
    expect(firstName,findsOneWidget);
    expect(lastName,findsOneWidget);
    expect(phone,findsOneWidget);
    expect(email,findsOneWidget);
    expect(send,findsOneWidget);

    //Проверка, что при пустых полях ввода ввыодится сообщения о необходимости ввода данных
    await tester.tap(send);
    await tester.pump();

    expect(find.text('Введите имя'), findsOneWidget);
    expect(find.text('Введите фамилию'), findsOneWidget);
    expect(find.text('Заполните поле телефон'), findsOneWidget);
    expect(find.text('Заполните поле email'), findsOneWidget);


    //Ввод данных в firtName и LastName
    await tester.enterText(firstName,'first');
    await tester.enterText(lastName, 'last');

    //Ввод некорректных данных в поля phone и email
    //Проверка, что сообщения выводится, некорректные данные в phone не отображаются
    await tester.enterText(phone, 'not digits');
    await tester.enterText(email, 'text');
    await tester.tap(send);
    await tester.pump();
    expect(find.text('Емейл не корректный'),findsOneWidget);
    expect(find.text('not digits'),findsNothing);

    //Ввод корректных данных. Проверка, что выводится сообщение об успешной регистрации
    await tester.enterText(email,'11@111.com');
    await tester.enterText(phone, '1234567');
    await tester.tap(send);
    await tester.pump();

    expect(find.text('Вы успешно зарегистрировались'),findsOneWidget);



  });



}