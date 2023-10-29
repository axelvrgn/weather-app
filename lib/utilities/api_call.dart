import 'package:http/http.dart' as http;

Future<http.Response> getRequest(String url, header) async {
  var response = await http.get(Uri.parse(url));
  return response;
}
