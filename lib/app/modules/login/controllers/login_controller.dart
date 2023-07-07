import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/login/models/login_model.dart';

import '../services/login_services.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerImpl with _$LoginController;

abstract class LoginControllerImpl with Store{

  
  @observable
  String stateController = 'start';

  @observable
  String token = '';

  @action
  void setStateController(String value) => stateController = value;

  @action
  Future<String> login(String email, String password) async {
    stateController = 'loading';
    final loginService = LoginService();
    final body = LoginModel(email: email, password: password);
    try {
      token = await loginService.postLoginApi(body);
      stateController = 'sucess';
    } catch (e) {
      stateController = 'error';
      token = '';
    }
    return token;
  }
}