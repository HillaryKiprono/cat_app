import 'package:http/http.dart';

class Network {
  final String url;
  // 2
  Network(this.url);
  // 3
  Future<String> getData() async {
    // 4
    final response = await get(Uri.parse(url));
    // 5
    if (response.statusCode == 200) {
      // 6
      return response.body;
    } else {
      return '';
    }
  }
}