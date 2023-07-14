import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/more/models/soccer_match_model.dart';
import '../../../../../../shared/api/state_response.dart';
import '../../../../../../shared/token/token_manager.dart';
import '../services/more_services.dart';

part 'more_controller.g.dart';

class MoreController = MoreControllerImpl with _$MoreController;

abstract class MoreControllerImpl with Store{
  @observable
  String stateController = StateResponse.start;


  @observable
  List<SoccerMatchModel> listSoccerMatch = [];

  @observable
  MoreServices moreServices = MoreServices();

  @observable
  TokenManager tokenManager = TokenManager();
  
  @action
  Future<void> listaRodadas() async {
    StateResponse.loading;
    try{
      String token = (await tokenManager.getToken())!;
      listSoccerMatch = await moreServices.postMoreServices(token);
      print(listSoccerMatch);
      StateResponse.sucess;
    } catch(e){
      StateResponse.error;
    }
  }
  
}