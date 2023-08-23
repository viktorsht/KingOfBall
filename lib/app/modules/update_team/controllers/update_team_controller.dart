import 'package:mobx/mobx.dart';

import '../../../../shared/api/state_response.dart';
import '../../../../shared/token/token_manager.dart';
import '../../start_navigation_bar/modules/home/models/team_game_model.dart';
import '../models/team_game_update.dart';
import '../services/update_team_services.dart';

part 'update_team_controller.g.dart';

class UpdateTeamController = UpdateTeamControllerBase with _$UpdateTeamController;

abstract class UpdateTeamControllerBase with Store {
 
  @observable
  String stateController = StateResponse.start;

  @action
  Future<TeamGameModel> updateTeam(String team, TeamGameUpdate body) async {

    stateController = StateResponse.loading;
    TokenManager tokenManager = TokenManager();
    final updateTeamServices = UpdateTeamServices();
    TeamGameModel retorno = TeamGameModel();

    String? token = await tokenManager.getToken();
    if(token != null){
      try {
        retorno = await updateTeamServices.updateTeamServices(token, team, body);
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
}
