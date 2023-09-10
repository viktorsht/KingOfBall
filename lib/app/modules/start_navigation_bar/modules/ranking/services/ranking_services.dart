import 'dart:convert';

import 'package:rei_da_bola/shared/auth/auth_controller.dart';

import '../../../../../../shared/api/api_headers.dart';
import '../../../../../../shared/api/routes_api.dart';
import '../../../../../../shared/client/http/client_http.dart';
import '../models/ranking_model.dart';

class RankingServices{
  final router = RoutersApi();
  final headersApi = DefaultHeadersApi();
  final httpService = HttpService();
  final auth = AuthController();

  Future<List<RankingModel>> getTeamScaleServices(String token, String edition) async {
    final url = '${RoutersApi.ranking}$edition';
    final response = await httpService.get(url, headersApi.headersToken(token));
    if(response.statusCode == 401){
      final data = await auth.refreshToken();
      if(data != null) getTeamScaleServices(data, edition);
    }
    final jsonList = jsonDecode(response.body) as List;
    return jsonList.map((json) => RankingModel.fromJson(json)).toList();
  }
  
}