import 'dart:async';
import 'dart:isolate';

main() async {
  var receivePort = ReceivePort();
  await Isolate.spawn(echo, receivePort.sendPort);

  // The 'echo' isolate sends it's SendPort as the first message
  var sendPort = await receivePort.first;

  var msg = await sendReceive(sendPort, "foo");
  print('received $msg');
  msg = await sendReceive(sendPort, "bar");
  print('received $msg');
}

// the entry point for the isolate
echo(SendPort sendPort) async {
  // Open the ReceivePort for incoming messages.
  var port = ReceivePort();

  // Notify any other isolates what port this isolate listens to.
  sendPort.send(port.sendPort);

  await for (var msg in port) {
    var data = msg[0];
    SendPort replyTo = msg[1];
    replyTo.send(data);
    if (data == "bar") port.close();
  }
}

/// sends a message on a port, receives the response,
/// and returns the message
Future sendReceive(SendPort port, msg) {
  ReceivePort response = ReceivePort();
  port.send([msg, response.sendPort]);
  return response.first;
}