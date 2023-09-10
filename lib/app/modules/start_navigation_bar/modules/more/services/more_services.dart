import 'dart:convert';
import 'package:rei_da_bola/shared/api/api_headers.dart';

import '../../../../../../shared/api/routes_api.dart';
import '../../../../../../shared/auth/auth_controller.dart';
import '../../../../../../shared/client/http/client_http.dart';
import '../../../../shared/models/soccer_match_model.dart';

class MoreServices{

  final headersApi = DefaultHeadersApi();
  final httpService = HttpService();
  final auth = AuthController();

  Future<List<SoccerMatchModel>> postMoreServices(String token) async {
    final url = '${RoutersApi.soccerMatch}?token=$token';
    final response = await httpService.get(url,headersApi.headersSimple,);
    if(response.statusCode == 401){
      final data = await auth.refreshToken();
      if(data != null) postMoreServices(data);
    }
    final list = jsonDecode(response.body) as List;
    return list.map((json) => SoccerMatchModel.fromJson(json)).toList();
  } 
  
}