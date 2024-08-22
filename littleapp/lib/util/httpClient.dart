import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpClient {
  String baseUrl = "192.168.15.187:8000";
  Client client = http.Client();
  Map<String, String> headers = {"content-type":"application/json; charset=utf-8"};

  Future<dynamic> get(String endpoint, {Map<String, dynamic>? parametros}) async {
    try {
      Uri uri = Uri.http(baseUrl, endpoint, parametros);
      Response response = await http.get(uri);

      if (response.statusCode >= 200 && response.statusCode <= 400) {
        return jsonDecode(response.body);
      }
      return null;

    }
    catch(err) {
      debugPrint("get:: err: $err");
      return {"err": err};
    }
  }

  Future<dynamic> post(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.http(baseUrl, endpoint);
      Response response = await http.post(uri, body: jsonEncode(body), headers: headers);

      if (response.statusCode >= 200 && response.statusCode <= 400) {
        return jsonDecode(response.body);
      }
      else return {"err": response.body};

    }
    catch(err) {
      debugPrint("get:: err: $err");
      return {"err": err};
    }
  }
}