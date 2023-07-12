import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/shared/api/api_headers.dart';

import '../../../../../../shared/api/routes_api.dart';
import '../../../../../../shared/auth/token_model.dart';
import '../../../../shared/models/user_model.dart';

class CardProfileServices{

  final headersApi = DefaultHeadersApi();

  Future<UserModel> postCardProfileServices(String token) async {
    final url = Uri.parse(RoutersApi.me);
    final body = TokenModel(token:token);
    final response = await http.post(
      url,
      body: jsonEncode(body),
      headers: headersApi.headers,
    );

    final json = jsonDecode(response.body);
    return UserModel.fromJson(json);
  } 


}