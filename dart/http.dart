import 'package:http/http.dart' as http;

Future<String> fetch(int number,Uri url) async {
  var response=await http.get(url);
  String date=response.headers['date'];
  return date+' process '+number.toString();
}

main() async {
  print('Trying http');
  var urlGit=Uri.parse('https://api.github.com/events');

  var date=await fetch(1, urlGit);
  print(date);
}