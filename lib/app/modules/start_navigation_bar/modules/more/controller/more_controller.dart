import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/shared/models/soccer_match_model.dart';
import '../../../../../../shared/api/state_response.dart';
import '../../../../../../shared/token/token_manager.dart';
import '../services/more_services.dart';

part 'more_controller.g.dart';

class MoreController = MoreControllerImpl with _$MoreController;

abstract class MoreControllerImpl with Store{
  @observable
  String stateController = StateResponse.start;

  @observable
  int numRodadas = 0;

  @observable
  List<SoccerMatchModel> listSoccerMatch = [];

  @action
  void setList(value) => listSoccerMatch = value;

  @observable
  MoreServices moreServices = MoreServices();

  @observable
  TokenManager tokenManager = TokenManager();

  @action
  void setNumRodadas(value) => numRodadas = value;

  @action
  void countRound(List<SoccerMatchModel> list){
    List<int> rodada = [];
    for (var i = 0; i < list.length; i++) {
      if(!rodada.contains(list[i].championshipRoundId)){
        rodada.add(list[i].championshipRoundId!);
        setNumRodadas(list[i].championshipRoundId);
      }
    }
  } 

  
  @action
  Future<List<SoccerMatchModel>> listaRodadas() async {
    List<SoccerMatchModel> list = [];
    stateController = StateResponse.loading;
    try{
      String token = (await tokenManager.getToken())!;
      list = await moreServices.postMoreServices(token);
      stateController = StateResponse.sucess;
    } catch(e){
      stateController = StateResponse.error;
    }
    return list;
  }

  @action
  Future<void> initMore() async {
    setNumRodadas(0);
    listSoccerMatch = await listaRodadas();
    setList(listSoccerMatch); // necessário estar aqui
    countRound(listSoccerMatch);
    //setNumRodadas(numRodadas/2);
  }
  
}