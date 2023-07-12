import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/login/models/login_model.dart';
import 'package:rei_da_bola/app/modules/shared/models/user_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/services/card_profile_services.dart';
import 'package:rei_da_bola/shared/token/token_manager.dart';

import '../../../../../../shared/api/state_response.dart';


part 'card_profile_controller.g.dart';

class CardProfileController = CardProfileControllerImpl with _$CardProfileController;

abstract class CardProfileControllerImpl with Store{

  
  @observable
  String stateController = StateResponse.start;

  @observable
  UserModel user = UserModel();

  @action
  Future<UserModel> profile(TokenManager tokenManager) async {
    String token = (await tokenManager.getToken())!;
    stateController = StateResponse.loading;
    final cardProfileService = CardProfileServices();
    UserModel user = UserModel();
    try {
      user = await cardProfileService.postCardProfileServices(token);
      stateController = StateResponse.sucess;
    } catch (e) {
      stateController = StateResponse.error;
    }
    return user;
  }

  @action
  Future<void>initProfile(TokenManager tokenManager) async {
    user = await profile(tokenManager);
  }
}