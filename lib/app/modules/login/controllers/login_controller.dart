import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/login/models/login_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';
import 'package:rei_da_bola/shared/token/token_manager.dart';

import '../services/login_services.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerImpl with _$LoginController;

abstract class LoginControllerImpl with Store{

  
  @observable
  String stateController = StateResponse.start;

  @observable
  String stateTeamController = StateResponse.start;

  @observable
  String stateMeController = StateResponse.start;

  @observable
  String token = '';

  @observable
  String idUser = '';

  @computed
  bool get isOkLoading => stateController == StateResponse.loading || stateTeamController == StateResponse.loading;

  @observable
  LoginServices loginService = LoginServices();

  @observable
  TokenManager tokenManager = TokenManager();

  @action
  void setStateController(String value) => stateController = value;

  @action
  Future<void> login(LoginModel body) async {
    stateController = StateResponse.loading;
    //final body = LoginModel(email: email, password: password);
    try {
      token = await loginService.postLoginApi(body);
      await tokenManager.setToken(token);
      //print(token);
      stateController = StateResponse.sucess;
    } catch (e) {
      stateController = StateResponse.error;
      token = '';
    }
    //return token;
  }

  @action
  Future<void> userIdMe() async {
    stateMeController = StateResponse.loading;
    try {
      print(token);
      idUser = (await loginService.checkIdUser(token)).toString();
      print(idUser);
      stateMeController = StateResponse.sucess;
    } catch (e) {
      stateMeController = StateResponse.error;
    }
    //return idUser;
  }

  @action
  Future<TeamGameModel> checkTeamVirtual() async {
    TeamGameModel team = TeamGameModel();
    stateTeamController = StateResponse.loading;
    try {
      team = await loginService.getCheckTeamVirtual(token, idUser);
      print(team.id);
      stateTeamController = StateResponse.sucess;
    } catch (e) {
      stateTeamController = StateResponse.error;
    }
    return team;
  }
}