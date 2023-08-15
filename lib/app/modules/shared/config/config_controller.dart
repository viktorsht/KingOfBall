import 'dart:math';
import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/lineup/models/register_lineup_model.dart';
import '../../../../../../../../design_system/images/images_app.dart';
import '../../../../../../../../shared/api/state_response.dart';
import '../../../../../../../../shared/token/token_manager.dart';

part 'config_controller.g.dart';

class ConfigController = ConfigControllerImpl with _$ConfigController;

abstract class ConfigControllerImpl with Store{

  @observable
  int edition = 0;

  @action
  void setEdition(value) => edition = value;

  @action
  int getEdition() => edition;

  @observable
  int round = 0;

  @action
  void setRound(value) => round = value;

  @action
  int getRound() => round;

  @observable
  int team = 0;

  @action
  void setTeam(value) => team = value;
  
  @action
  int getTeam() => team;
}