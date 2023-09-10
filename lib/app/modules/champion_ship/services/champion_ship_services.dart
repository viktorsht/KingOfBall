import 'dart:convert';
import '../../../../../../shared/api/routes_api.dart';
import '../../../../shared/api/api_headers.dart';
import '../../../../shared/auth/auth_controller.dart';
import '../../../../shared/client/http/client_http.dart';
import '../models/champion_ship_models.dart';
import '../models/team_game_edition_model.dart';
import '../models/team_game_edition_sucess_model.dart';

class ChampionShipServices{

  final headersApi = DefaultHeadersApi();
  final httpService = HttpService();
  final auth = AuthController();

  Future<List<ChampionShipEditionModel>> getChampionShipServices(String token) async {
    final response = await httpService.get(RoutersApi.championshipEdition, headersApi.headersToken(token));
    if(response.statusCode == 401){
      final data = await auth.refreshToken();
      if(data != null) getChampionShipServices(data);
    }
    final list = jsonDecode(response.body) as List;
    return list.map((json) => ChampionShipEditionModel.fromJson(json)).toList();
  } 
  
  Future<TeamGameEditionSucessModel> postTeamGameEdition(String token, TeamGameEditionModel body) async {
    final response = await httpService.post(RoutersApi.teamGameEdition, body.toJson(),headersApi.headersToken(token));
    if(response.statusCode == 401){
      final data = await auth.refreshToken();
      if(data != null) postTeamGameEdition(data, body);
    }
    final json = jsonDecode(response.body);
    return TeamGameEditionSucessModel.fromJson(json);
  }
}