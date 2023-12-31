import 'package:http/http.dart' as http;

class HttpConnection {
  final String baseUrl;

  HttpConnection({
    required this.baseUrl,
  });

  Future<String> getData(String baseUrl) async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return response.body;
    }
    throw Exception();
  }
}
