import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../../shared/api/routes_api.dart';

class TeamServices{

  //final headersApi = DefaultHeadersApi();

  Future<void> getTeamServices(String token) async {
    final url = Uri.parse('${RoutersApi.soccerMatch}?token=$token');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      url,
      headers: headers,
    );

    final list = jsonDecode(response.body) as List;
    //return list.map((json) => SoccerMatchModel.fromJson(json)).toList();
  } 
  
}