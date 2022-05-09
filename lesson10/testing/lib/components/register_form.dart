import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/validate_email.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key ?key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSuccess = false;
  void _handleSubmit() {
    if (_formKey.currentState?.validate()==true) {
      setState(() {
        _isSuccess = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            key: const Key('firstName'),
            decoration: const InputDecoration(labelText: 'First name'),
            validator: (value) {
              if (value == '') return 'Введите имя';
              return null;
            },
          ),
          TextFormField(
            key: const Key('lastName'),
            decoration: const InputDecoration(labelText: 'Last name'),
            validator: (value) {
              if (value == '') return 'Введите фамилию';
              return null;
            },
          ),
          TextFormField(
            key: const Key('phone'),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              //WhitelistingTextInputFormatter.digitsOnly
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(labelText: 'Phone'),
            validator: (value) {
              if (value == '') return 'Заполните поле телефон';
              return null;
            },
          ),
          TextFormField(
            key: const Key('email'),
            decoration: const InputDecoration(labelText: 'Email'),

            validator: (value) {
              if (value == '') return 'Заполните поле email';
              if (!validateEmail(value!)) {return 'Емейл не корректный';}
              return null;
            },
          ),

          RaisedButton(
            key: const Key('send'),
            child: const Text('Отправить'),
            onPressed: _handleSubmit,
          ),
          if (_isSuccess) const Text('Вы успешно зарегистрировались')
        ],
      ),
    );
  }
}
