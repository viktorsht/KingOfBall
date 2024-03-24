import 'dart:convert';
import '../../../../../../shared/api/api_headers.dart';
import '../../../../../../shared/api/routes_api.dart';
import '../../../../../../shared/auth/auth_controller.dart';
import '../../../../../../shared/client/http/client_http.dart';
import '../models/football_field_model.dart';

class FootballFieldServices{
  final router = RoutersApi();
  final headersApi = DefaultHeadersApi();
  final httpService = HttpService();
  final auth = AuthController();

  Future<List<FootballFieldModel>> getTeamScaleServices(String token, String round, String team) async {
    final url = router.matchGameLineup(round, team);
    print(url);
    final response = await httpService.get(url,headersApi.headersToken(token));
    final jsonList = jsonDecode(response.body) as List;
    return jsonList.map((json) => FootballFieldModel.fromJson(json)).toList();
  }
  
}