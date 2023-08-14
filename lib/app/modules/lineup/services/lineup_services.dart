import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/app/modules/lineup/models/lu_player_lineup_model.dart';
import '../../../../shared/api/routes_api.dart';

class LineUpServices{
  final router = RoutersApi();
  Future<List<PlayerLineUpModel>> getPlayersApiServices(String token, String position, String round) async {
    final url = Uri.parse(router.positionName(position, round));
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      url,
      headers: headers,
    );
    final jsonList = jsonDecode(response.body) as List;

    return jsonList.map((json) => PlayerLineUpModel.fromJson(json)).toList();
  }
}