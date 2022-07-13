import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class CallApi {
  final String baseUrl = "https://sowlab.tech/assignment/";

  registerAccount(Map<String, dynamic> data, String apiUrl) async {
    var newData = data;
    String fullUrl = baseUrl + apiUrl;
    var res = http.post(
      Uri.parse(fullUrl),
      body: newData,
    );
    return res;
  }

  loginAccount(String data, String apiUrl) async {
    var newData = data;
    String fullUrl = baseUrl + apiUrl;
    final headers = {"Content-Type": "application/json"};
    var res = await http.post(
      Uri.parse(fullUrl),
      headers: headers,
      body: data,
    );
    var body = jsonDecode(res.body);
    print(body);
    print(res.statusCode);
    return res;
  }

  forgotPassAccount(String data, String apiUrl) async {
    var newData = data;
    String fullUrl = baseUrl + apiUrl;
    final headers = {"Content-Type": "application/json"};
    var res = await http.post(
      Uri.parse(fullUrl),
      headers: headers,
      body: data,
    );
    var body = jsonDecode(res.body);
    print(body);
    print(res.statusCode);
    return res;
  }

  verifyotpAccount(String data, String apiUrl) async {
    String fullUrl = baseUrl + apiUrl;
    final headers = {"Content-Type": "application/json"};
    var res = await http.post(
      Uri.parse(fullUrl),
      headers: headers,
      body: data,
    );
    var body = jsonDecode(res.body);
    print(body);
    print(res.statusCode);
    return res;
  }

  resetPassAccount(String data, String apiUrl) async {
    String fullUrl = baseUrl + apiUrl;
    final headers = {"Content-Type": "application/json"};
    var res = await http.post(
      Uri.parse(fullUrl),
      headers: headers,
      body: data,
    );
    var body = jsonDecode(res.body);
    print(body);
    print(res.statusCode);
    return res;
  }
}
