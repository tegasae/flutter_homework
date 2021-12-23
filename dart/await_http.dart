import 'dart:io';

import 'package:http/http.dart' as http;

Future<String> fetch(Uri url,int number) {
  String date='';
  print('Start ${number}');

  http.Response response;
  return Future(() async {                // <== Этот код будет исполнен когда-то в будущем
    print('C running Future from $number');
    response = await http.get(url);
    date=response.headers['date'];

  }).then((_){
    print(response);
    print('C end of Future from $number $date');

    return date+' '+number.toString();
  });


}

main() async {
  const String urlStr='https://api.github.com/events';
  Uri url=Uri.parse(urlStr);

  List<Future<String>> lfs=<Future<String>>[];

  for (int i=1;i<=3;i++) {
    lfs.add(fetch(url, i));
  }

  for (int i=0;i<3;i++) {
    print(await lfs[i]);

  }
  //print(await fetch(url, 1));

}