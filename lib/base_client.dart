import 'package:http/http.dart' as http;

const String baserUrl = 'https://63b5402e9f50390584c45dd2.mockapi.io';

class BaseClient {
  var client = http.Client();
  // var _headers = {
  //   'apiKey' ='aaa',
  //   'Authorization' ='aaa',
  //
  // };

  Future<dynamic> get(String api) async {
    var url = Uri.parse(baserUrl + api);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // failure
    }
  }

  Future<dynamic> post(String api) async {}

  Future<dynamic> edit(String api) async {}

  Future<dynamic> delete(String api) async {}
}
