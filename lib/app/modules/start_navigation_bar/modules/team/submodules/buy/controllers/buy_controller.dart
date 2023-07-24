import 'dart:math';

import 'package:mobx/mobx.dart';

import '../../../../../../../../design_system/images/images_app.dart';
import '../../../../../../../../shared/api/state_response.dart';
import '../../../../../../../../shared/token/token_manager.dart';
import '../models/buy_model.dart';
import '../services/buy_services.dart';

part 'buy_controller.g.dart';

class BuyController = BuyControllerImpl with _$BuyController;

abstract class BuyControllerImpl with Store{
  @observable
  String stateController = StateResponse.start;

  @observable
  TokenManager tokenManager = TokenManager();

  @observable
  BuyServices buyServices = BuyServices();

  @observable
  List<BuyModel> listBuy = [];

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
  List<BuyModel> groupItemsByAbb(List<BuyModel> items) {
    Map<String, List<BuyModel>> groupedByPosition = {};
    List<String> positionOrder = ['GOL', 'ZAG', 'LAT', 'MEI', 'VOL', 'ATA'];
    List<BuyModel> groupedItems = [];

    for (var item in items) {
      String positionAbb = item.player!.position!.abb!;
      if (groupedByPosition.containsKey(positionAbb)) {
        groupedByPosition[positionAbb]!.add(item);
      } else {
        groupedByPosition[positionAbb] = [item];
      }
    }
    for (var positionAbb in positionOrder) {
      if (groupedByPosition.containsKey(positionAbb)) {
        groupedItems.addAll(groupedByPosition[positionAbb]!);
      }
    }
    return groupedItems;
  }

  @action
  void setList(value) => listBuy = value;
  
  @action
  Future<List<BuyModel>> players() async {
    List<BuyModel> list = [];
    stateController = StateResponse.loading;
    String? token = await tokenManager.getToken();
    if(token != null){
      try{
        list = await buyServices.getPlayersApi(token);
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
  Future<void> initBuy() async {
  List<BuyModel> list = [];
    list = await players();
    setList(groupItemsByAbb(list));
  }
  
}