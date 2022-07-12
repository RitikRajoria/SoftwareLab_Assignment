import 'dart:convert';

import 'package:http/http.dart' as http;

class RegisterCallApi {
  final String baseUrl = "https://sowlab.tech/assignment/";

  registerAccount(data, apiUrl) {
    var prints = jsonEncode(data);
    print(prints);
    var fullUrl = baseUrl + apiUrl;
    return http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {'Content-Type': 'multipart/form-data'};
}
