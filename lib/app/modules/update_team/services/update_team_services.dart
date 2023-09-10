import 'dart:convert';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';

import '../../../../shared/api/api_headers.dart';
import '../../../../shared/api/routes_api.dart';
import '../../../../shared/client/http/client_http.dart';
import '../models/team_game_update.dart';

class UpdateTeamServices{

  final router = RoutersApi();
  final headersApi = DefaultHeadersApi();
  final httpService = HttpService();
  
  Future<TeamGameModel> updateTeamServices(String token, String team, TeamGameUpdate body) async {
    final url = '${RoutersApi.teamGame}/$team';
    final response = await httpService.post(url,body.toJson(), headersApi.headersToken(token));
    final json = jsonDecode(response.body);
    return TeamGameModel.fromJson(json);
  }

}