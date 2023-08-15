import 'dart:math';
import 'package:mobx/mobx.dart';
import '../../../../../../../../design_system/images/images_app.dart';
import '../../../../../../../../shared/api/state_response.dart';
import '../../../../../../../../shared/token/token_manager.dart';
import '../models/lu_player_lineup_model.dart';
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
  Future<List<PlayerLineUpModel>> playersForPosition(String position, String round, String edition) async {
    List<PlayerLineUpModel> list = [];
    stateController = StateResponse.loading;
    String? token = await tokenManager.getToken();
    if(token != null){
      try{
        list = await lineUpServices.getPlayersApiServices(token, position, round, edition);
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

  @observable
  int edition = 0;

  @action
  void setEdition(value) => edition = value;

  @action
  Future<void> initBuy(String position, int round) async {
    List<PlayerLineUpModel> list = [];
    list = await playersForPosition(position, round.toString(), edition.toString());
    print("Jogadores $position ${list[0].score}- ${list.length}");
    setList(list);
  }
}