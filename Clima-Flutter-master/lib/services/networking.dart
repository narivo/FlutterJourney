import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Uri _uri;

  NetworkHelper(this._uri);

  Future getData() async {
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
