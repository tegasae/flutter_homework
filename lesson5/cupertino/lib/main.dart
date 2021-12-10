import 'dart:ui';

import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',

      home: CupertinoExample(),
    );
  }
}

class CupertinoExample extends StatefulWidget {
  const CupertinoExample({Key? key}) : super(key: key);

  @override
  _CupertinoExampleState createState()=> _CupertinoExampleState();
}

class _CupertinoExampleState extends State<CupertinoExample> {
  void _showModalPopup(String title) {
    showCupertinoModalPopup(context: context, builder: (context) => Container(
      height: 240,
      color: CupertinoColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
                style: const TextStyle(color: CupertinoColors.activeGreen)
              ),
              const SizedBox(height: 12),
              const Text('text')
            ],
          )
        )
      ),
      filter: ImageFilter.blur(sigmaX: 4,sigmaY: 4)
    );


  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            trailing: Icon(CupertinoIcons.info),
            leading: Text('leading'),
            middle: Text('Middle')
        ),
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  CupertinoButton(
                    child: const Text('Button'),
                    onPressed: () {
                      _showModalPopup('Filled button');
                    },
                  ),
                  const SizedBox(height: 24),
                  CupertinoButton.filled(child: const Text('Filled'),
                      onPressed: (){
                        _showModalPopup('Filled button');
                      }),
                  const CupertinoTextField(
                      placeholder: 'Email'
                  )
                ],
              ),

            )
        )
    );
  }

}