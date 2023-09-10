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
  StateRequest stateController = InitialState();

  @observable
  StateRequest stateTeamController = InitialState();

  @observable
  StateRequest stateMeController = InitialState();

  @observable
  String token = '';

  @observable
  String idUser = '';

  @computed
  bool get isOkLoading => stateController == LoadingState() || stateTeamController == LoadingState();

  @observable
  LoginServices loginService = LoginServices();

  @observable
  TokenManager tokenManager = TokenManager();

  @action
  Future<void> login(LoginModel body) async {
    stateController = LoadingState();
    try {
      token = await loginService.postLoginApi(body);
      await tokenManager.setToken(token);
      stateController = SucessState();
    } catch (e) {
      stateController = ErrorState();
    }
  }

  @action
  Future<void> userIdMe() async {
    stateMeController = LoadingState();
    try {
      idUser = (await loginService.checkIdUser(token)).toString();
      stateMeController = SucessState();
    } catch (e) {
      stateMeController = ErrorState();
    }
  }

  @action
  Future<TeamGameModel> checkTeamVirtual() async {
    TeamGameModel team = TeamGameModel();
    stateTeamController = LoadingState();
    try {
      team = await loginService.getCheckTeamVirtual(token, idUser);
      stateTeamController = SucessState();
    } catch (e) {
      stateTeamController = ErrorState();
    }
    return team;
  }
}