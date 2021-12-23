import 'dart:async';
import 'dart:isolate';

import 'package:http/http.dart' as http;

main() async {

  List<ReceivePort> receivePort=[];
  const String urlStr='https://api.github.com/events';
  Uri url=Uri.parse(urlStr);
  // create a long-lived port for receiving messages
  var ourFirstReceivePort = new ReceivePort();

  // spawn an 'echo' actor, then 'await' for it to reply.
  // 'echo' is the name of a function below;
  // see its source code to see how it works.
  var isolate=await Isolate.spawn(getHTTP, ourFirstReceivePort.sendPort);

  // the 'echo' isolate sends us its SendPort as its first message.
  // this lets us communicate with it. we’ll always use this port to
  // send it messages.
  var echoPort = await ourFirstReceivePort.first;

  // if you try to use our first receive port, you’ll get this error:
  // “Bad state: Stream has already been listened to.”
  // so it seems like you always need a new port to communicate with
  // an isolate (actor).
  for (int i=0;i<3;i++) {
    var ourSecondReceivePort = ReceivePort();
    receivePort.add(ourSecondReceivePort);
    echoPort.send([url, i, ourSecondReceivePort.sendPort]);
  }
  for (int i=0;i<3;i++) {
    var msg = await receivePort[i].first;
    print('main received "$msg"');
  }


  isolate.kill();
  print('end of main');

}

// `echo` is an async function, and it works a little like
// the equivalent of an Akka actor.
getHTTP(SendPort sendPort) async {

  String date='';
  int num=0;

  var ourReceivePort = ReceivePort();

  sendPort.send(ourReceivePort.sendPort);


  await for (var msg in ourReceivePort) {
    Uri url = msg[0];                // the 1st element we receive should be their message
    num=msg[1];
    //print('echo received "$data"');

    var response = await http.get(url);
    date=await response.headers['date'];
    if (num==1) {
      print(num);
      await Future.delayed(Duration(seconds: 5));
    }
    SendPort replyToPort = msg[2];    // the 2nd element should be their port


    replyToPort.send(['Date: ' + date, num]);

  }
}