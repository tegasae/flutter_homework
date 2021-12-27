import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyTextField(),
    );
  }
}

class MyTextField extends StatefulWidget {
  const MyTextField({Key? key}) : super(key: key);



  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  bool obscureText=false;
  String textLabel="Search";

  final myController = TextEditingController();
  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('TextfField'),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           TextField(
             controller: myController,
             onTap: () {
               //obscureText=!obscureText;

               setState(() {
                 //textLabel="Введите текст для поиска";
               });
             },
             obscureText: obscureText,
             style: TextStyle(color: Colors.purple),
             decoration: InputDecoration(
               enabledBorder: OutlineInputBorder(
                   //borderSide: BorderSide(color: Colors.teal),
                    borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
                   borderRadius: BorderRadius.all(Radius.circular(10.0)),

               ),
               border: OutlineInputBorder(
                 //borderSide: BorderSide(color: Colors.teal),
                 borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
                 borderRadius: BorderRadius.all(Radius.circular(10.0)),

               ),
               focusedBorder:OutlineInputBorder(
                 borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                 borderRadius: BorderRadius.circular(25.0),
               ),
               helperText: '123',
               hintText: '456'  ,
               hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent),
               labelText: textLabel,
               suffixIcon: const Icon(Icons.search, color: Colors.purple),
             ),

           ),
            TextButton(onPressed: (){}, child: Text('123'))
          ],
        ),
      ),

    );
  }

  @override
  void dispose() {

    myController.dispose();
    super.dispose();
  }
}
