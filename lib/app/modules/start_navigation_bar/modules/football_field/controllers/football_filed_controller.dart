import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/models/coach_model.dart';
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

  void setIsChange() => isChange = true;

  @observable
  List<FootballFieldModel> playerList = [];

  @observable
  List<CoachModel> coachList = [];

  @action
  void setCoachList(value) => coachList = value;
  
  @observable
  FootballFieldServices footballFieldServices = FootballFieldServices();

  @action
  Future<List<FootballFieldModel>> checkTeamScale(String round, String team) async {
    stateController = StateResponse.loading;
    List<FootballFieldModel> retorno = [];
    TokenManager tokenManager = TokenManager();
    String? token = await tokenManager.getToken();
    //print("object");
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

  @action
  Future<List<CoachModel>> checkCoach(String edition) async {
    stateController = StateResponse.loading;
    List<CoachModel> retorno = [];
    TokenManager tokenManager = TokenManager();
    String? token = await tokenManager.getToken();
    //print("object");
    if(token != null){
      try {
        retorno = await footballFieldServices.getCoachServices(token, edition);
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
  Future<List<FootballFieldModel>> initTeamScale(int round, int team, int edition) async {
    setRound(round);
    playerList = await checkTeamScale(round.toString(), team.toString());
    coachList = await checkCoach(edition.toString());
    //setCoachList(list)
    //print('Lista de jogadores da api = ${playerList.length}');
    return playerList;
  }
}