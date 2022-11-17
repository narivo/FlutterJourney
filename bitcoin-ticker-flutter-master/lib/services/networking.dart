import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

const coinApiKey = 'D04832C8-2A19-4B5D-823F-75A6EFF79744';
//'30F861C6-CFA1-4F74-9CE5-E685CBF07364';

class NetworkHelper {
  Uri _uri;

  NetworkHelper(this._uri);

  Future getData() async {
    try {
      http.Response response = await http
          .get(
            _uri,
            headers: {
              'X-CoinAPI-Key': coinApiKey,
            },
          )
          .timeout(Duration(seconds: 10))
          .catchError((error) {
            throw error;
          });
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } on HandshakeException catch (error) {
      throw error;
    } on SocketException catch (error) {
      throw error;
    }
  }
}
