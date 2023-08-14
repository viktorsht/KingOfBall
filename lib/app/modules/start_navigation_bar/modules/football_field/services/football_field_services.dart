import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../../shared/api/routes_api.dart';
import '../models/football_field_model.dart';

class FootballFieldServices{
  final router = RoutersApi();
  Future<List<FootballFieldModel>> getTeamScaleServices(String token, String round, String team) async {
    final url = Uri.parse(router.matchGameLineup(round, team));
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

    return jsonList.map((json) => FootballFieldModel.fromJson(json)).toList();

  } 
  
}