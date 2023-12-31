import 'dart:convert';
import 'package:rei_da_bola/app/modules/login/models/login_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/shared/api/api_headers.dart';
import '../../../../shared/api/routes_api.dart';
import '../../../../shared/auth/token_model.dart';
import '../../../../shared/client/http/client_http.dart';

class LoginServices{
  final headersApi = DefaultHeadersApi();
  final httpService = HttpService();

  Future<String> postLoginApi(LoginModel body) async{
    final response = await httpService.post(RoutersApi.login, body.toJson(), headersApi.headersSimple);
    final json = jsonDecode(response.body);
    return json['token'];
  }

  Future<int> checkIdUser(String token) async{
    final data = TokenModel(token: token);
    final response = await httpService.post(RoutersApi.me,data.toJson(), headersApi.headersSimple);
    final json = jsonDecode(response.body);
    return json['id'];
  }
  
  Future<TeamGameModel> getCheckTeamVirtual(String token, String idUser) async{
    final url = '${RoutersApi.checkIdUser}$idUser';
    final response = await httpService.get(url,headersApi.headersToken(token));
    final json = jsonDecode(response.body);
    return TeamGameModel.fromJson(json[0]);
  }
}