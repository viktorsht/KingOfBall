import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/shared/api/api_headers.dart';

import '../../../../../../shared/api/routes_api.dart';
import '../../../../../../shared/auth/token_model.dart';
import '../models/soccer_match_model.dart';

class MoreServices{

  final headersApi = DefaultHeadersApi();

  Future<List<SoccerMatchModel>> postMoreServices(String token) async {
    final url = Uri.parse(RoutersApi.soccerMatch);
    final body = TokenModel(token:token);
    final response = await http.post(
      url,
      body: jsonEncode(body),
      headers: headersApi.headers,
    );

    final list = jsonDecode(response.body) as List;
    return list.map((json) => SoccerMatchModel.fromJson(json)).toList();
  } 
  
}