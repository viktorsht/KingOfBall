import 'dart:math';
import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/lineup/models/register_lineup_model.dart';
import '../../../../../../../../design_system/images/images_app.dart';
import '../../../../../../../../shared/api/state_response.dart';
import '../../../../../../../../shared/token/token_manager.dart';
import '../models/player_lineup_model.dart';
import '../services/lineup_services.dart';

part 'lineup_controller.g.dart';

class LineUpController = LineUpControllerImpl with _$LineUpController;

abstract class LineUpControllerImpl with Store{
  @observable
  String stateController = StateResponse.start;

  @observable
  TokenManager tokenManager = TokenManager();

  @observable
  LineUpServices lineUpServices = LineUpServices();

  @observable
  List<PlayerLineUpModel> listLineUp = [];

  @observable
  List<String> image = [ImagesApp.jogador1, ImagesApp.jogador2, ImagesApp.jogador3];

  @observable
  int previousNumber = 0;

  @action
  int generateNumber() {
    final random = Random();
    int number;
    do {
      number = random.nextInt(3);
    } while (number == previousNumber);
    previousNumber = number;
    return number;
  }

  @action
  void setList(value) => listLineUp = value;
  
  @action
  Future<List<PlayerLineUpModel>> playersForPosition(String position) async {
    List<PlayerLineUpModel> list = [];
    stateController = StateResponse.loading;
    String? token = await tokenManager.getToken();
    if(token != null){
      try{
        list = await lineUpServices.getPlayersApiServices(token, position);
        stateController = StateResponse.sucess;
      } catch(e){
        stateController = StateResponse.error;
      }
    }
    else{
      stateController = StateResponse.error;
    }
    return list;
  }

  @action
  Future<void> addListPlayerApi(List<int> listId, int round, int team, int status) async {
    stateController = StateResponse.loading;
    String? token = await tokenManager.getToken();
    print(listId);
    if(token != null){
      try {
        final body = RegisterLineUpModel(
          gameLineup: listId,
          championshipRoundId: round,
          teamGameEditionId: team
        );
        await lineUpServices.postRegisterLineUp(token, body);
        stateController = StateResponse.sucess;
      } catch (e) {
        stateController = StateResponse.error;
      }
    }
    else{
      stateController = StateResponse.error;
    }

  }

  @observable
  int round = 0;

  @action
  void setRound(value) => round = value;

  @observable
  int status = 1;

  @action
  void setStatus(value) => status = value;

  @action
  int getStatus() => status;

  @action
  Future<void> initBuy(String position, int round, int edition1) async {
    List<PlayerLineUpModel> list = [];
    setRound(round);
    list = await playersForPosition(position);
    setList(list);
  }
}