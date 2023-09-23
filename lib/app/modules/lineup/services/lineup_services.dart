import 'dart:convert';
import 'package:rei_da_bola/app/modules/lineup/models/player_lineup_model.dart';
<<<<<<< HEAD
import 'package:rei_da_bola/app/modules/lineup/models/update_lineup_mode.dart';
=======
>>>>>>> bb3d9c9a911a953d5a1c5e18e617bbefc212a283
import '../../../../shared/api/api_headers.dart';
import '../../../../shared/api/routes_api.dart';
import '../../../../shared/auth/auth_controller.dart';
import '../../../../shared/client/http/client_http.dart';
import '../models/register_lineup_model.dart';

class LineUpServices{

  final router = RoutersApi();
  final headersApi = DefaultHeadersApi();
  final httpService = HttpService();
  final auth = AuthController();
  
<<<<<<< HEAD
  Future<List<PlayerLineUpModel>> getLineUpService(String token, String position) async {
=======
  Future<List<PlayerLineUpModel>> getPlayersApiServices(String token, String position) async {
>>>>>>> bb3d9c9a911a953d5a1c5e18e617bbefc212a283
    final url = router.positionName(position);
    final response = await httpService.get(url,headersApi.headersToken(token));
    final jsonList = jsonDecode(response.body) as List;
    return jsonList.map((json) => PlayerLineUpModel.fromJson(json)).toList();
  }

<<<<<<< HEAD
  Future<int> postLineUpService(String token, RegisterLineUpModel body) async {
    final url = RoutersApi.lineUp;
    final response = await httpService.post(url,body.toJson(),headersApi.headersToken(token));
    return response.statusCode;
  }

  Future<int> updateLineUpService(String token, UpdateLineupModel body) async {
    final url = RoutersApi.lineUp;
    final response = await httpService.post(url,body.toJson(),headersApi.headersToken(token));
    return response.statusCode;
=======
  Future<RegisterLineUpModel> postRegisterLineUp(String token, RegisterLineUpModel body) async {
    final url = RoutersApi.lineUp;
    final response = await httpService.post(url,body.toJson(),headersApi.headersToken(token));
    final json = jsonDecode(response.body);
    return RegisterLineUpModel.fromJson(json);
>>>>>>> bb3d9c9a911a953d5a1c5e18e617bbefc212a283
  }
}