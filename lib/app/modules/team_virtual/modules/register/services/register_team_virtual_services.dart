import 'dart:convert';
import 'package:rei_da_bola/shared/api/api_headers.dart';

import '../../../../../../shared/api/routes_api.dart';
import '../../../../../../shared/auth/auth_controller.dart';
import '../../../../../../shared/client/http/client_http.dart';
import '../../../../shared/models/error.dart';
import '../model/register_team_virtual_model.dart';
import '../model/register_team_virtual_sucess_model.dart';

class RegisterTeamVirtualServices{

  final headersApi = DefaultHeadersApi();
  final httpService = HttpService();
  final auth = AuthController();

  Future<RegisterTeamVirtualSucessModel> postRegisterTeamVirtualApi(RegisterTeamVirtualModel body, String token) async {
    final url = RoutersApi.teamGame;
    final response = await httpService.post(url,body.toJson(),headersApi.headersToken(token));
    if(response.statusCode == 401){
      final data = await auth.refreshToken();
      if(data != null) postRegisterTeamVirtualApi(body, data);
    }
    if(response.statusCode == 201){
      final json = jsonDecode(response.body);
      return RegisterTeamVirtualSucessModel.fromJson(json);
    }
    else if(response.statusCode == 422){
      final json = jsonDecode(response.body);
      final errors = json['errors'];
      throw ErrorRegisterExceptionModel(errors);
    }
    else{
      throw Exception('Falha ao cadastrar usuário');
    }
  } 
}