import 'dart:convert';
import '../../../../../../shared/api/api_headers.dart';
import '../../../../../../shared/api/routes_api.dart';
import '../../../../../../shared/auth/auth_controller.dart';
import '../../../../../../shared/client/http/client_http.dart';
import '../models/coach_model.dart';
import '../models/football_field_model.dart';

class FootballFieldServices{
  final router = RoutersApi();
  final headersApi = DefaultHeadersApi();
  final httpService = HttpService();
  final auth = AuthController();

  Future<List<FootballFieldModel>> getTeamScaleServices(String token, String round, String team) async {
    final url = router.matchGameLineup(round, team);
    final response = await httpService.get(url,headersApi.headersToken(token));
    if(response.statusCode == 401){
      final data = await auth.refreshToken();
      if(data != null) getTeamScaleServices(data, round, team);
    }
    final jsonList = jsonDecode(response.body) as List;
    return jsonList.map((json) => FootballFieldModel.fromJson(json)).toList();
  }

  Future<List<CoachModel>> getCoachServices(String token, String edition) async {
    final url = '${RoutersApi.coach}$edition';
    final response = await httpService.get(url,headersApi.headersToken(token));
    if(response.statusCode == 401){
      final data = await auth.refreshToken();
      if(data != null) getCoachServices(data, edition);
    }
    final jsonList = jsonDecode(response.body) as List;
    return jsonList.map((json) => CoachModel.fromJson(json)).toList();
  }  
  
}