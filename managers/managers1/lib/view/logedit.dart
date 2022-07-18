import 'package:flutter/material.dart';

class LogEdit extends StatelessWidget {
  const LogEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        TextFormField(
          initialValue: '123',
        ),
      ],
    );
  }
}
