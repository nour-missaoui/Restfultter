import 'dart:convert';

import 'package:flutter/cupertino.dart';
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

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baserUrl + api);
    var _paylod = json.encode(object);
    var _headers = {'Content-Type': 'application/json'};
    debugPrint('post:' + _paylod);
    var response = await client.post(url, body: _paylod, headers: _headers);
    debugPrint('post:' + response.body);

    if (response.statusCode == 201) {
      return response.body;
    } else {
      // failure
    }
  }

  Future<dynamic> edit(String api, dynamic object) async {
    var url = Uri.parse(baserUrl + api);
    var _paylod = json.encode(object);
    var _headers = {'Content-Type': 'application/json'};
    var response = await client.put(url, body: _paylod, headers: _headers);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      // failure
    }
  }

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baserUrl + api);
    var response = await client.delete(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // failure
    }
  }
}
