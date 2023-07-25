import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';
import '../../../../../shared/token/token_manager.dart';
import '../models/championsship_round_model.dart';
import '../services/championship_round_service.dart';

part 'championship_round_controller.g.dart';

class ChampionshipRoundController = ChampionshipRoundControllerImpl with _$ChampionshipRoundController;

abstract class ChampionshipRoundControllerImpl with Store{

  @observable
  String stateController = StateResponse.start;

  @observable
  String token = '';

  @observable
  ChampionshipRoundModel round = ChampionshipRoundModel();

  @observable
  ChampionshipRoundServices championshipRoundServices = ChampionshipRoundServices();

  @action
  Future<ChampionshipRoundModel> roundToday(String token) async {
    List<ChampionshipRoundModel> retorno = [];
    stateController = StateResponse.loading;
    try {
      retorno = await championshipRoundServices.getChampionshipRound(token);
      stateController = StateResponse.sucess;
      print(retorno[0].name);
    } catch (e) {
      stateController = StateResponse.error;
    }
    // vai retornar o primeiro elemento por enquanto. Quando tiver uma solução 
    //para a rodada atual esta função deve ser adaptada
    return retorno[0]; 
  }

  @action
  Future<void> initRoundToday() async {
    TokenManager tokenManager = TokenManager();
    String? token = await tokenManager.getToken();
    if(token != null){
      round = await roundToday(token);
    }
  }
}