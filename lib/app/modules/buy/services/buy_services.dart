import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/app/modules/buy/models/buy_model.dart';
import 'package:rei_da_bola/shared/api/api_headers.dart';

import '../../../../shared/api/routes_api.dart';

class BuyServices{
  
  final headersApi = DefaultHeadersApi();

  Future<List<BuyModel>> getPlayersApi(String token) async {
    final url = Uri.parse('${RoutersApi.playerEdition}?token=$token');
    final response = await http.get(
      url,
      headers: headersApi.headers,
    );
    final list = jsonDecode(response.body) as List;
    return list.map((json) => BuyModel.fromJson(json)).toList();
  } 

}