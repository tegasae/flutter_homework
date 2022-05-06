import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/validate_email.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key ?key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            decoration: InputDecoration(labelText: 'First name'),
            validator: (value) {
              if (value == '') return 'Введите имя';
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Last name'),
            validator: (value) {
              if (value == '') return 'Введите фамилию';
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              //WhitelistingTextInputFormatter.digitsOnly
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(labelText: 'Phone'),
            validator: (value) {
              if (value == '') return 'Заполните поле телефон';
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == '') return 'Заполните поле email';
              if (!validateEmail(value!)) return 'Емейл не корректный';
              return null;
            },
          ),
          RaisedButton(
            child: Text('Отправить'),
            onPressed: _handleSubmit,
          ),
          if (_isSuccess) Text('Вы успешно зарегистрировались')
        ],
      ),
    );
  }
}
