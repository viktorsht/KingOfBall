import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../../shared/api/routes_api.dart';
import '../../../../shared/models/error.dart';
import '../model/register_team_virtual_model.dart';
import '../model/register_team_virtual_sucess_model.dart';

class RegisterTeamVirtualServices{

  Future<RegisterTeamVirtualSucessModel> postRegisterTeamVirtualApi(RegisterTeamVirtualModel body, String token) async {
    final url = Uri.parse(RoutersApi.register);
    final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body.toJson()),
    );

    if(response.statusCode == 201){
      final json = jsonDecode(response.body);
      final userJson = json['user'];
      return RegisterTeamVirtualSucessModel.fromJson(userJson);
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