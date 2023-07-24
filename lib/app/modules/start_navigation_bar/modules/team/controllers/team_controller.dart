import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/shared/models/user_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/services/team_services.dart';
import 'package:rei_da_bola/shared/token/token_manager.dart';
import '../../../../../../shared/api/state_response.dart';

part 'team_controller.g.dart';

class TeamController = TeamControllerImpl with _$TeamController;

abstract class TeamControllerImpl with Store{

  @observable
  String stateController = StateResponse.start;

  @observable
  UserModel user = UserModel();

  @observable
  TeamGameModel teamGameModel = TeamGameModel();
  
  @observable
  TeamServices teamService = TeamServices();

  @action
  Future<UserModel> checkTeamScale() async {
    stateController = StateResponse.loading;
    UserModel retorno = UserModel();
    TokenManager tokenManager = TokenManager();
    String? token = await tokenManager.getToken();
    if(token != null){
      try {
        //retorno = await teamService.getTeamServices(token);
        stateController = StateResponse.sucess;
      } catch (e) {
        stateController = StateResponse.error;
      }
    }
    else{
      stateController = StateResponse.error;
    }
    return retorno;
  }


  @action
  Future<void> initTeamScale() async {
    user = await checkTeamScale();
  }
}