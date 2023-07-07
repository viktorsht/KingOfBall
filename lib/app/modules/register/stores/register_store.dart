import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreImpl with _$RegisterStore;

abstract class RegisterStoreImpl with Store{
  @observable
  String user = "";

  @action
  void setUser(String value) => user = value;
  
  @observable
  String team = "";

  @action
  void setTeam(String value) => team = value;

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;
  
  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordLook = false;

  @action
  void togglePasswordLook() => passwordLook = !passwordLook;

  @computed
  bool get isUserValid => user.length >= 6;

  @computed
  bool get isTeamValid => team.length >= 6;

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isEmailValid => RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(email);

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid && isUserValid && isTeamValid;

}