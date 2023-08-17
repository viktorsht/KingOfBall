import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rei_da_bola/app/modules/shared/score/models/score_model.dart';
import '../../../../../shared/api/routes_api.dart';

class ScoreServices{

  Future<ScoreModel> getScore(String token, String team) async {
    final url = Uri.parse('${RoutersApi.score}$team');
    final headers = {
      'Authorization': 'Bearer $token', 
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.get(url, headers: headers);

    final json = jsonDecode(response.body);
    return ScoreModel.fromJson(json['score']);
  }
}