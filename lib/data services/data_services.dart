import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class RegisterCallApi {
  final String baseUrl = "https://sowlab.tech/assignment/user/register";

  registerAccount(Map<String, dynamic> data) async {
    var newData = data;
    var res = http.post(
      Uri.parse(baseUrl),
      body: newData,
    );
    return res;
  }

  loginAccount(Map<String, dynamic> data) async {
    var newData = data;
    var res = http.post(
      Uri.parse(baseUrl),
      body: newData,
    );
    return res;
  }

  _setHeaders() => {'Content-Type': 'multipart/form-data'};
}
