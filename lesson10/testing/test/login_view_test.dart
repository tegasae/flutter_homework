import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/components/login_form.dart';
import 'package:testing/views/login_view.dart';

void main() {
  testWidgets('Login View Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView(key: Key('login'))));

    Key registration=const Key('registration');

    //
    expect(find.byKey(registration), findsOneWidget);
    await tester.enterText(find.byKey(Key('email')), '111111');
    await tester.pump();
    //expect(find.text('Поле email заполнено не корректно'), findsOneWidget);


    //await tester.tap(find.byKey(Key('registration')));

    //await tester.pump();
    //expect(find.byKey(Key('firstName')), findsOneWidget);

  });
}