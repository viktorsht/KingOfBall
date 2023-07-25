import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../shared/api/api_headers.dart';
import '../../../../shared/api/routes_api.dart';
import '../models/championsship_round_model.dart';

class ChampionshipRoundServices{

  final headersApi = DefaultHeadersApi();
  
  Future<List<ChampionshipRoundModel>> getChampionshipRound(String token) async {
    final url = Uri.parse(RoutersApi.championshipRound);
    final headers = {
      'Authorization': 'Bearer $token', 
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.get(url, headers: headers);

    final list = jsonDecode(response.body) as List;
    print('lista: $list');
    return list.map((json) => ChampionshipRoundModel.fromJson(json)).toList();
  }
}