import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../shared/api/routes_api.dart';
import '../../start_navigation_bar/modules/football_field/models/football_field_model.dart';

class LineUpServices{
  Future<List<FootballFieldModel>> getPlayersApiServices(String token, String position) async {
    final url = Uri.parse('${RoutersApi.positionName}$position');
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

    return jsonList.map((json) => FootballFieldModel.fromJson(json)).toList();
  }
}