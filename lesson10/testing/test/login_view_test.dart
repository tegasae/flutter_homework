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



    //
    expect(loginOrRegistration, findsOneWidget);
    expect(email, findsOneWidget);
    expect(phone,findsOneWidget);
    expect(send,findsOneWidget);


    await tester.tap(send);
    await tester.pump();
    expect(find.text('Введите email'), findsOneWidget);
    expect(find.text('Введите телефон'), findsOneWidget);

    await tester.enterText(email,'text');
    await tester.enterText(phone,'not digits');
    await tester.tap(send);
    await tester.pump();
    expect(find.text('Поле email заполнено не корректно'),findsOneWidget);
    expect(find.text('not digits'),findsNothing);

    await tester.enterText(email,'11@111.com');
    await tester.enterText(phone, '1234567');
    await tester.tap(send);
    await tester.pump();
    expect(find.text('Добро пожаловать'),findsOneWidget);


    await tester.pumpWidget(const MaterialApp(home: LoginView()));
    await tester.tap(loginOrRegistration);
    await tester.pump();

    expect(firstName,findsOneWidget);
    expect(lastName,findsOneWidget);
    expect(email,findsOneWidget);
    expect(phone,findsOneWidget);
    expect(send,findsOneWidget);

    await tester.tap(send);
    await tester.pump();

    expect(find.text('Введите имя'), findsOneWidget);
    expect(find.text('Введите фамилию'), findsOneWidget);
    expect(find.text('Заполните поле телефон'), findsOneWidget);
    expect(find.text('Заполните поле email'), findsOneWidget);

    await tester.enterText(firstName,'first');
    await tester.enterText(lastName, 'last');
    await tester.enterText(phone, 'not digits');
    await tester.enterText(email, 'text');
    await tester.tap(send);
    await tester.pump();

    expect(find.text('Емейл не корректный'),findsOneWidget);
    expect(find.text('not digits'),findsNothing);

    await tester.enterText(email,'11@111.com');
    await tester.enterText(phone, '1234567');
    await tester.tap(send);
    await tester.pump();

    expect(find.text('Вы успешно зарегистрировались'),findsOneWidget);



  });



}