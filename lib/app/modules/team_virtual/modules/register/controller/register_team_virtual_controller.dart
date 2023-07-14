import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/shared/models/error.dart';

import '../../../../../../shared/api/state_response.dart';
import '../../../../../../shared/token/token_manager.dart';
import '../model/register_team_virtual_model.dart';
import '../model/register_team_virtual_sucess_model.dart';
import '../services/register_team_virtual_services.dart';

part 'register_team_virtual_controller.g.dart';

class RegisterTeamVirtualController = RegisterTeamVirtualControllerImpl with _$RegisterTeamVirtualController;

abstract class RegisterTeamVirtualControllerImpl with Store{

  
  @observable
  String stateController = StateResponse.start;

  @action
  void setStateController(String value) => stateController = value;

  @observable
  bool hasName = false;

  @observable
  bool hasAbb = false;

  @observable
  bool hasUserId = false;
  
  @observable
  int? userId;

  @action
  void contarElementosNoJSON(dynamic exception) {
    if (exception is ErrorRegisterExceptionModel) {
      Map<String, dynamic> errors = exception.errors;

      if (errors.containsKey('name')) {
        hasName = true;
      }

      if (errors.containsKey('abb')) {
        hasAbb = true;
      }
      if (errors.containsKey('user_id')) {
        hasUserId = true;
      }
    }
  }

  @action
  Future<RegisterTeamVirtualSucessModel> registerTeamVirtual(String name, String abb, int userId) async {
    stateController = StateResponse.loading;
    final registerService = RegisterTeamVirtualServices();
    var retorno = RegisterTeamVirtualSucessModel();
    final body = RegisterTeamVirtualModel(name: name,abb: abb,userId: userId);
    final tokenManager = TokenManager();
    print("object");
    String? token = await tokenManager.getToken();
    print(token);
    try {
      retorno = await registerService.postRegisterTeamVirtualApi(body, token!);
      print(retorno);
      //userId = retorno.user?.id;
      stateController = StateResponse.sucess;
    } catch (e) {
      stateController = StateResponse.error;
      contarElementosNoJSON(e);
      //rethrow;
      //final erro = Errors.fromJson(e.toString());
    }
    return retorno;
  }
}