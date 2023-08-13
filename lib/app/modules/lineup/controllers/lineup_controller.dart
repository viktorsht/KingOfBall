import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/models/football_field_model.dart';

import '../../../../../../../../design_system/images/images_app.dart';
import '../../../../../../../../shared/api/state_response.dart';
import '../../../../../../../../shared/token/token_manager.dart';
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
  List<FootballFieldModel> listBuy = [];

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
  void setList(value) => listBuy = value;
  
  @action
  Future<List<FootballFieldModel>> playersForPosition(String position) async {
    List<FootballFieldModel> list = [];
    stateController = StateResponse.loading;
    String? token = await tokenManager.getToken();
    if(token != null){
      try{
        list = await lineUpServices.getPlayersApiServices(token, position);
        //print(list[0].player!.firstname);
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
  Future<void> initBuy(String position) async {
    List<FootballFieldModel> list = [];
    list = await playersForPosition(position);
    setList(list);
  }
}