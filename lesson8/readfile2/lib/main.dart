import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              //primary: Colors.purple,
              backgroundColor: Colors.black45,
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                //side: BorderSide(color: Colors.red)
              )
          ),

        ),
        textTheme: const TextTheme(
            button: TextStyle(fontSize: 20, color: Colors.black),
            bodyText1: TextStyle(fontSize: 30, color: Colors.black),
            bodyText2: TextStyle(fontSize: 30, color: Colors.black),
            headline6: TextStyle(fontSize: 20, color: Colors.black),
            subtitle1: (TextStyle(fontSize: 20, color: Colors.black))),
        dialogTheme: const DialogTheme(),
        inputDecorationTheme: const InputDecorationTheme(

            //contentPadding: EdgeInsets.all(0),
            focusColor: Colors.black45,
            enabledBorder: OutlineInputBorder(
              //borderSide: BorderSide(color: Colors.teal),
              borderSide:
                  BorderSide(color: Colors.black45),
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
            ),
            border: OutlineInputBorder(
              //borderSide: BorderSide(color: Colors.red),

              borderRadius: BorderRadius.all(Radius.circular(0.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
            )),

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  final ValueNotifier<String?> fileNameNofifier = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read file'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        child: TextField(
                          controller: myController,
                          onSubmitted: (String str) {
                            print(str);
                            fileNameNofifier.value = str;
                          },
                          //obscureText: obscureText,
                          decoration: const InputDecoration(
                            hintText: 'file1',
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        // style: ButtonStyle(
                        //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        //         RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(0.0),
                        //             //side: BorderSide(color: Colors.red)
                        //         )
                        //     )
                        // ),
                        onPressed: () {
                          print(myController.text);
                          fileNameNofifier.value = myController.text;
                        },
                        child: const Text('OK'))
                  ],
                ),
              ),
              ValueListenableBuilder<String?>(
                  valueListenable: fileNameNofifier,
                  builder: (context, value, child) {
                    if (value == null) {
                      return Container();
                    } else {
                      print('value');
                      return FutureBuilder<String>(
                          //future: compute(Albums.readAlbums,assetBundle),
                          //future: rootBundle.loadString('assets/file1.txt', cache: true),
                          future: rootBundle.loadString(
                              'assets/' + value + '.txt',
                              cache: true),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data!);
                              }
                              if (snapshot.hasError) {
                                return Text(
                                    'Error ' + snapshot.error.toString());
                              }
                            }
                            return const CircularProgressIndicator();
                          });
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
