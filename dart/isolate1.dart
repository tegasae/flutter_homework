// importing dart libraries

import 'dart:io';
import 'dart:async';
import 'dart:isolate';

// Creating geek isolate
Isolate geek;

void start_geek_process() async {

  // port for isolate to receive messages.
  ReceivePort geekReceive= ReceivePort();

  // Starting an isolate
  geek = await Isolate.spawn(gfg, geekReceive.sendPort);
}

void gfg(SendPort sendPort) {
  int counter = 0;

  // Printing Output message after every 2 sec.
  Timer.periodic(new Duration(seconds: 1), (Timer t) {
    // Increasing the counter
    counter++;

    //Printing the output message
    stdout.writeln('Welcome to GeeksForGeeks $counter');
  });
}

void stop_geek_process() {

  // Checking the isolate with null
  if (geek != null) {
    stdout.writeln('--------------Stopping Geek Isolate--------------');

    // Killing the isolate
    geek.kill(priority: Isolate.immediate);

    // Setting the isolate to null
    geek = null;
  }
}

// Main Function
void main() async {
  stdout.writeln('--------------Starting Geek Isolate--------------');

  // Starting the isolate with start_geek_process
  await start_geek_process();
  stdout.writeln('Press enter key to quit');

  // Whenever enter is hit the program is stopped
  //await stdin.first;
  sleep(new Duration(seconds: 10));
  for (int i=0;i<1000000000;i++) {
    if (i % 100000000==0) {
      print(i);
    }

  }


  // Calling the stop_geek_process
  stop_geek_process();

  // Printing the goodbye message
  stdout.writeln('GoodBye Geek!');

  // Exiting the program.
  exit(0);
}