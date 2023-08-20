import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../../shared/api/routes_api.dart';
import '../models/ranking_model.dart';

class RankingServices{
  final router = RoutersApi();
  Future<List<RankingModel>> getTeamScaleServices(String token, String edition) async {
    final url = Uri.parse('${RoutersApi.ranking}$edition');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      url,
      headers: headers,
    );
    final jsonList = jsonDecode(response.body) as List;

    return jsonList.map((json) => RankingModel.fromJson(json)).toList();

  }
  
}