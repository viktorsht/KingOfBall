import 'package:mobx/mobx.dart';

part 'update_team_store.g.dart';

class UpdateTeamStore = UpdateTeamStoreImpl with _$UpdateTeamStore;

abstract class UpdateTeamStoreImpl with Store{

  @observable
  bool sucessUpdate = false;

  @action
  void setSucessRegister() => sucessUpdate = true;

  @observable
  String nameTeam = '';

  @action
  void setNameTeam(String value) => nameTeam = value;

  @observable
  String abbTeam = '';

  @action
  void setAbbTeam(String value) => abbTeam = value;

  @action
  void clearValues(){
    nameTeam = '';
    abbTeam = '';
  }

  @computed
  bool get isFormValid => nameTeam.isNotEmpty && abbTeam.isNotEmpty;

}