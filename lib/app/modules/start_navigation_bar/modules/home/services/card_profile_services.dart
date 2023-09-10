import 'dart:convert';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/shared/api/api_headers.dart';

import '../../../../../../shared/api/routes_api.dart';
import '../../../../../../shared/auth/auth_controller.dart';
import '../../../../../../shared/auth/token_model.dart';
import '../../../../../../shared/client/http/client_http.dart';
import '../../../../shared/user/models/user_model.dart';

class CardProfileServices{

  final headersApi = DefaultHeadersApi();
  final httpService = HttpService();
  final auth = AuthController();

  Future<UserModel> postCardProfileServices(String token) async {
    final url = RoutersApi.me;
    final body = TokenModel(token:token);
    final response = await httpService.post(url,body.toJson(),headersApi.headersSimple,);
    if(response.statusCode == 401){
      final data = await auth.refreshToken();
      if(data != null) postCardProfileServices(data);
    }
    final json = jsonDecode(response.body);
    return UserModel.fromJson(json);
  } 

  Future<TeamGameModel> getInfoProfileUser(String token) async {
    final response = await httpService.get(RoutersApi.teamGame,headersApi.headersToken(token));
    if(response.statusCode == 401){
      final data = await auth.refreshToken();
      if(data != null) getInfoProfileUser(data);
    }
    final json = jsonDecode(response.body);
    return TeamGameModel.fromJson(json[0]);
  }


}