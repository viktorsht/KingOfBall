import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/register/models/register_user_model.dart';
import 'package:rei_da_bola/app/modules/register/models/register_user_sucess_model.dart';

import '../../shared/api/state_response.dart';
import '../services/register_services.dart';

part 'register_user_controller.g.dart';

class RegisterController = RegisterControllerImpl with _$RegisterController;

abstract class RegisterControllerImpl with Store{

  
  @observable
  String stateController = StateResponse.start;

  @observable
  String token = '';

  @action
  void setStateController(String value) => stateController = value;

  @action
  Future<RegisterUserSucessModel> registerUser(String firstNameUser, String lastNameUser, String nick, String email, String password) async {
    stateController = StateResponse.loading;
    final registerService = RegisterServices();
    var retorno = RegisterUserSucessModel();
    final body = RegisterUserModel(firstName: firstNameUser,lastName: lastNameUser,nick: nick,email: email,password: password);
    try {
      retorno = await registerService.postRegisterUserApi(body);
      stateController = StateResponse.sucess;
    } catch (e) {
      stateController = StateResponse.error;
      print("${e}");
      //final erro = Errors.fromJson(e.toString());

    }
    return retorno;
  }
}