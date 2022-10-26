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

        primarySwatch: Colors.blue,
      ),
      //home: ExampleValueNotifier(),
      initialRoute: '/',
      routes: {'/' : (context) => ExampleValueNotifier(),
                '/page': (context) => Scaffold(appBar: AppBar(),body: Text('1234'),) },
    );
  }
}

class MyValueNotifier<T> extends ValueNotifier<T> {
  MyValueNotifier(super.value);
  @override
  void dispose() {
    print('1234');
    super.dispose();


  }
}


class ExampleValueNotifier extends StatelessWidget {
  ExampleValueNotifier({Key? key}) : super(key:key);






  List<int> array = [];
  int counter =0;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> counterNofifier=MyValueNotifier<int>(0);
    final ValueNotifier<List<int>> arrayNotifier=MyValueNotifier<List<int>>([]);
    print('BUILD');
    return Scaffold(appBar: AppBar(),
        body: Padding(padding: EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[Row(
                children: [

                  const SizedBox(width: 20),
                  Expanded(child: Text('$counter'))
                ],
              ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        child: const Text('counter ValueNotifier'),
                        onPressed: () {
                          counterNofifier.value++;
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: ValueListenableBuilder<int>(
                          valueListenable: counterNofifier,
                          builder: (context,value,child) {
                            print(value.runtimeType);
                            return Text(value.toString());
                          },
                        )
                    )
                  ],
                ),
                const Divider(),

                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                          child: const Text('arryaValueNotifier'),
                          onPressed: (){
                            final plusOne=arrayNotifier.value.length+1;
                            arrayNotifier.value=[...arrayNotifier.value,plusOne];
                            //arrayNotifier.value.add(plusOne);
                          },
                        )
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                        child: ValueListenableBuilder<List<int>>(
                          valueListenable: arrayNotifier,
                          builder: (context,value,child){
                            return Text('$value');
                          },
                        )
                    )
                  ],
                ),
                const Divider(),
                ExampleNotifier(),
                Profile(),
                TextButton(onPressed: () {Navigator.pushReplacementNamed(context, '/page');}, child: Text('123'))
              ],

            )
        )
    );
  }
}

class ExampleNotifier extends StatelessWidget {
  const ExampleNotifier({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<List<int>> array=ValueNotifier<List<int>>([]);
    print('Build example notifier');
    return Row(
      children: [
        Expanded(
          child: TextButton(
            child: Text('StatelessWidget ValueNotifier'),
            onPressed: () {
              array.value=[...array.value,array.value.length+1];
              //array.value.add(array.value.length+1);
            },
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
            child: ValueListenableBuilder<List<int>>(
                valueListenable: array,
                builder: (context,value,child) {
                  return Text('$value');
                }
            )
        )
      ],
    );
  }
}

class Profile extends StatefulWidget {
  Profile({Key? key}):super(key:key);

  @override
  _ProfileState createState()=>_ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext build) {
    print('Build Profile');
    return Container(
        child: const Text('Profile widget')
    );
  }
}