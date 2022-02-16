import 'package:http/http.dart' as http;
import 'package:http/retry.dart';


main() async {
  GetData getData=GetData('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
  print('hello');
  String str=await getData.getData();
  //print(str);
  //Uri url = Uri.parse('http://192.168.100.1/');
  //var response = await http.get(url).timeout(Duration(seconds: 10));
  //print('Response status: ${response.statusCode}');
  //print('Response body: ${response.body}');
  //final client = RetryClient(http.Client());
  //try {
  //  print(await client.read(Uri.parse('http://example.org')));
  //} finally {
  //  client.close();
  //}

}

class GetData {
  //final String url;
  late final String json;
  late final Uri url;

  GetData(String url) {
    this.url = Uri.parse(url);
  }

  Future<String> getData() async {
    http.Response response;
    final client = RetryClient(http.Client());
    try {
      response=await client.get(url);
    } finally {
      client.close();
    }
    json=response.body;
    
    return json;
  }






}