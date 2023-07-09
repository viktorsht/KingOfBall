import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/app/modules/login/models/login_model.dart';
import 'package:rei_da_bola/shared/api/api_headers.dart';

import '../../../../shared/api/routes_api.dart';

class LoginServices{
  final headersApi = DefaultHeadersApi();
  Future<String> postLoginApi(LoginModel body) async {
    final url = Uri.parse(RoutersApi.login);
    final response = await http.post(
      url,
      headers: headersApi.headers,
      body: jsonEncode(body.toJson()),
    );
    final json = jsonDecode(response.body);
    return json['token'];
  } 
}