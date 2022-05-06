import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/components/login_form.dart';
import 'package:testing/views/login_view.dart';

void main() {
  testWidgets('Login View Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginView(key: Key('login'))));
    
    expect(find.byKey(Key('column')), findsOneWidget);
    await tester.enterText(find.byKey(Key('email')), '111111');
    expect(find.text('111111'), findsOneWidget);
    

    //await tester.tap(find.byKey(Key('registration')));

    //await tester.pump();
    //expect(find.byKey(Key('firstName')), findsOneWidget);

  });
}