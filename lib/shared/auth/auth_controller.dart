import 'package:rei_da_bola/shared/api/api_headers.dart';
import 'package:rei_da_bola/shared/api/routes_api.dart';
import 'package:rei_da_bola/shared/auth/token_model.dart';
import 'package:rei_da_bola/shared/client/http/client_http.dart';
import 'package:rei_da_bola/shared/token/token_manager.dart';

class AuthController {
  final _tokenManager = TokenManager();
  final headersApi = DefaultHeadersApi();
  final httpService = HttpService();
  bool isAuthenticated = false;

  Future<bool> checkAuthenticated() async {
    String? storedToken = await _tokenManager.getToken();
    if(storedToken != null){
      isAuthenticated = await verifyTokenValidity(storedToken);
      if(isAuthenticated == false){
        isAuthenticated = await refreshToken(storedToken);
      }
    }
    return isAuthenticated;
  }

  Future<bool> verifyTokenValidity(String token) async {
    final body = TokenModel(token: token);
    try {
      await httpService.post(RoutersApi.me, body.toJson(), headersApi.headersSimple);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> refreshToken(String token) async {
    final body = TokenModel(token: token);
    try {
      final data = await httpService.post(RoutersApi.refesh, body.toJson(), headersApi.headersSimple);
      await _tokenManager.setToken(data['token']);
      return true;
    } catch (e) {
      return false;
    }
  }
}
