import 'dart:convert';

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
        final token = await refreshToken();
        if(token != null)isAuthenticated = true;
      }
    }
    return isAuthenticated;
  }

  Future<bool> verifyTokenValidity(String token) async {
    final body = TokenModel(token: token);
    try {
      final response = await httpService.post(RoutersApi.me, body.toJson(), headersApi.headersSimple);
      if(response.statusCode == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<String?> refreshToken() async {
    String? token = await _tokenManager.getToken();
    if(token != null){
      final body = TokenModel(token: token);
      try {
        final response = await httpService.post(RoutersApi.refresh, body.toJson(), headersApi.headersSimple);
        if(response.statusCode == 200){
          final data = jsonDecode(response.body);
          await _tokenManager.setToken(data['token']);
          return data['token'];
        }
        return null;
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}
