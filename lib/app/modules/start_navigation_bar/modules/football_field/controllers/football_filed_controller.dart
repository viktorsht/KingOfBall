import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/shared/token/token_manager.dart';
import '../../../../../../shared/api/state_response.dart';
import '../models/football_field_model.dart';
import '../services/football_field_services.dart';

part 'football_filed_controller.g.dart';

class FootballFieldController = FootballFieldControllerImpl with _$FootballFieldController;

abstract class FootballFieldControllerImpl with Store{

  @observable
  String stateController = StateResponse.start;

  @observable
  bool isChange = false;

  @action
  void setIsChange() => isChange = true;

  @observable
  List<FootballFieldModel> playerList = [];

  @action
  void setPlayerList(value) => playerList = value;
  
  @observable
  FootballFieldServices footballFieldServices = FootballFieldServices();

  @action
  Future<List<FootballFieldModel>> checkTeamScale(String round, String team) async {
    stateController = StateResponse.loading;
    List<FootballFieldModel> retorno = [];
    TokenManager tokenManager = TokenManager();
    String? token = await tokenManager.getToken();
    if(token != null){
      try {
        retorno = await footballFieldServices.getTeamScaleServices(token, round, team);
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

  @observable
  int round = 0;

  @action
  void setRound(value) => round = value;

  @action
  Future<void> fechTeamScale(int round, int team, int edition) async {
    playerList = await checkTeamScale(round.toString(), team.toString());
<<<<<<< HEAD
=======
    setPlayerList(playerList);
>>>>>>> bb3d9c9a911a953d5a1c5e18e617bbefc212a283
  }

}