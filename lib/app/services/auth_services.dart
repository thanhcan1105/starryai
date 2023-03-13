import 'dart:convert';


import 'package:http/http.dart' as http;

import '../../constants.dart';

class AuthService {
  Future login({required Map<String, dynamic> data}) async {
    final res = await http.post(
      Uri.parse('${CONST.API_BASE_URL}/login'),
      body: {
        'email': data['email'],
        'password': data['password'],
      },
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return bodyResponse;
    } else {
      return null;
    }
  }

  Future register({required Map<String, dynamic> data}) async {
    final res = await http.post(
      Uri.parse('${CONST.API_BASE_URL}/register'),
      body: {
        "email": data['email'],
        "password": data['password'],
      },
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return bodyResponse;
    }
  }
}
