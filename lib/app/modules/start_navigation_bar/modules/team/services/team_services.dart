import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/models/player_model.dart';
import '../../../../../../shared/api/routes_api.dart';

class TeamServices{

  Future<List<PlayerModel>> getTeamServices(String token) async {
    final url = Uri.parse(RoutersApi.matchGameLineup);
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

    return jsonList.map((json) => PlayerModel.fromJson(json['player_lineup']['player_edition']['player'])).toList();
  } 
  
}