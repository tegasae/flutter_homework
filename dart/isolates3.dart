import 'dart:async';
import 'dart:isolate';

main() async {
  List<ReceivePort> receivePorts=[];
  // create a long-lived port for receiving messages
  var ourFirstReceivePort = new ReceivePort();

  var isolate=await Isolate.spawn(echo, ourFirstReceivePort.sendPort);

  var echoPort = await ourFirstReceivePort.first;


  //var ourSecondReceivePort = ReceivePort();
  //echoPort.send(['message 1', ourSecondReceivePort.sendPort]);
  //var msg = await ourSecondReceivePort.first;
  //print('main received "$msg"');
  for (int i=0;i<3;i++) {
    receivePorts.add(ReceivePort());
    echoPort.send(['message 1 $i',receivePorts.last.sendPort]);
  }
  print('----');
  for (int i=0;i<3;i++) {
    var msg=await receivePorts.first;
    print('main received "$msg"');
  }

  // instead of 'await', use 'then' as a different way of receiving
  // a reply from 'echo' (handle it asynchronously, rather than
  // waiting for the reply)
  // var port3 = ReceivePort();
  // echoPort.send(['message 2', port3.sendPort]);
  // port3.first.then((msg) {
  //   print('main received "$msg"');
  // });
  //
  // // use 'then' one more time
  // var port4 = ReceivePort();
  // echoPort.send(['port 4', port4.sendPort]);
  // port4.first.then((msg) {
  //   print('main received "$msg"');
  // });
  //
  print('end of main');
  print(isolate);
  //isolate.kill();
}

// `echo` is an async function, and it works a little like
// the equivalent of an Akka actor.
echo(SendPort sendPort) async {

  // open our receive port. this is like turning on
  // our cellphone.
  var ourReceivePort = ReceivePort();

  // tell whoever created us what port they can reach us on
  // (like giving them our phone number)
  sendPort.send(ourReceivePort.sendPort);

  // listen for text messages that are sent to us,
  // and respond to them with this algorithm
  await for (var msg in ourReceivePort) {
    var data = msg[0];                // the 1st element we receive should be their message
    print('echo received "$data"');
    SendPort replyToPort = msg[1];    // the 2nd element should be their port

    // add a little delay to simulate some work being done
    Future.delayed(const Duration(milliseconds: 100), () {
      // send a message back to the caller on their port,
      // like calling them back after they left us a message
      // (or if you prefer, they sent us a text message, and
      // now we’re texting them a reply)
      replyToPort.send('echo said: ' + data);
    });

    // you can close the ReceivePort if you want
    //if (data == "bye") ourReceivePort.close();
  }
}