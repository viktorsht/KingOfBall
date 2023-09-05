import 'package:rei_da_bola/app/modules/shared/score/models/score_model.dart';
import 'package:rei_da_bola/shared/api/api_headers.dart';
import 'package:rei_da_bola/shared/client/http/client_http.dart';
import '../../../../../shared/api/routes_api.dart';

class ScoreServices{
  
  final httpService = HttpService();
  final headersApi = DefaultHeadersApi();

  Future<ScoreModel> getScore(String token, String team) async {
    final url = '${RoutersApi.score}$team';
    final response = await httpService.get(url, headersApi.headersToken(token));
    return ScoreModel.fromJson(response['score']);
  }
}