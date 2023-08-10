import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/models/player_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/services/team_services.dart';
import 'package:rei_da_bola/shared/token/token_manager.dart';
import '../../../../../../shared/api/state_response.dart';

part 'team_controller.g.dart';

class TeamController = TeamControllerImpl with _$TeamController;

abstract class TeamControllerImpl with Store{

  @observable
  String stateController = StateResponse.start;

  @observable
  bool isChange = false;

  @observable
  List<PlayerModel> playerList = [];
  
  @observable
  TeamServices teamService = TeamServices();

  @action
  Future<List<PlayerModel>> checkTeamScale() async {
    stateController = StateResponse.loading;
    List<PlayerModel> retorno = [];
    TokenManager tokenManager = TokenManager();
    String? token = await tokenManager.getToken();
    //print("object");
    if(token != null){
      try {
        retorno = await teamService.getTeamServices(token);
        //print(retorno);
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
  Future<List<PlayerModel>> initTeamScale() async {
    playerList = await checkTeamScale();
    //print('Lista de jogadores da api = ${playerList.length}');
    return playerList;
  }
}