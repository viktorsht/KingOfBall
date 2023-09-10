import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/shared/models/error.dart';
import 'package:rei_da_bola/app/modules/register_user/models/register_user_model.dart';

import '../../../../shared/api/state_response.dart';
import '../services/register_services.dart';

part 'register_user_controller.g.dart';

class RegisterController = RegisterControllerImpl with _$RegisterController;

abstract class RegisterControllerImpl with Store{

  
  @observable
  StateRequest stateController = InitialState();

  @observable
  bool hasEmail = false;

  @observable
  bool hasNick = false;
  
  @observable
  int? userId;

  @action
  void cleanFiels(){
    stateController = InitialState();
    hasEmail = false;
    hasNick = false;
  }

  @action
  void contarElementosNoJSON(dynamic exception) {
    if (exception is ErrorRegisterExceptionModel) {
      Map<String, dynamic> errors = exception.errors;
      if (errors.containsKey('nick')) {
        hasNick = true;
      }
      if (errors.containsKey('email')) {
        hasEmail = true;
      }
    }
  }

  @action
  Future<void> registerUser(RegisterUserModel body) async {
    stateController = LoadingState();
    final registerService = RegisterServices();
    try {
      await registerService.postRegisterUserApi(body);
      stateController = SucessState();
    } catch (e) {
      stateController = ErrorState();
      contarElementosNoJSON(e);
    }
  }
}