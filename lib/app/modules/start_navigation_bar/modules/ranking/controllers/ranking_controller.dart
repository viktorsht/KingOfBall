import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/ranking/models/ranking_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/ranking/services/ranking_services.dart';

import '../../../../../../shared/api/state_response.dart';
import '../../../../../../shared/token/token_manager.dart';

part 'ranking_controller.g.dart';

class RankingController = RankingControllerImpl with _$RankingController;

abstract class RankingControllerImpl with Store{

  @observable
  String stateController = StateResponse.start;

  @observable
  RankingServices rankingServices = RankingServices();

  @observable
  List<RankingModel> rankingList = [];

  @action
  Future<List<RankingModel>> checkRanking(String edition) async {
    stateController = StateResponse.loading;
    List<RankingModel> retorno = [];
    TokenManager tokenManager = TokenManager();
    String? token = await tokenManager.getToken();
    if(token != null){
      try {
        retorno = await rankingServices.getTeamScaleServices(token, edition);
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

  Future<void> initRanking(int edition) async {
    rankingList = await checkRanking(edition.toString());
  }
  
}