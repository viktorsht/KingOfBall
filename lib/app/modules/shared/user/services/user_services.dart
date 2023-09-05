import 'package:rei_da_bola/shared/client/http/client_http.dart';
import '../../../../../shared/api/api_headers.dart';
import '../../../../../shared/api/routes_api.dart';
import '../../../../../shared/auth/token_model.dart';
import '../../../start_navigation_bar/modules/home/models/team_game_model.dart';

class UserServices{
  final httpService = HttpService();
  final headersApi = DefaultHeadersApi();

  Future<int> checkIdUser(String token) async {
    final body = TokenModel(token:token);
    final response = await httpService.post(RoutersApi.me, body.toJson(), headersApi.headersSimple);
    return response['id'];
  }
  
  Future<TeamGameModel> getCheckTeamVirtual(String token, String idUser) async {
    final url = '${RoutersApi.checkIdUser}$idUser';
    final response = await httpService.get(url, headersApi.headersToken(token));
    return TeamGameModel.fromJson(response[0]);
  }
}