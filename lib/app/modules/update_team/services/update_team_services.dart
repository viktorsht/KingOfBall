import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';

import '../../../../shared/api/routes_api.dart';
import '../models/team_game_update.dart';

class UpdateTeamServices{
  
  Future<TeamGameModel> updateTeamServices(String token, String team, TeamGameUpdate body) async {
    final url = Uri.parse('${RoutersApi.teamGame}/$team');
    print(jsonEncode(body.toJson()));
    final headers = {
      'Authorization': 'Bearer $token', 
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.post(
      url, 
      headers: headers,
      body: jsonEncode(body.toJson())
    );
    final json = jsonDecode(response.body);
    print(response.statusCode);
    return TeamGameModel.fromJson(json);
  }

}