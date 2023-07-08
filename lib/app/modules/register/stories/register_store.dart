import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreImpl with _$RegisterStore;

abstract class RegisterStoreImpl with Store{
  @observable
  String firstNameUser = "";

  @action
  void setFirstNameUser(String value) => firstNameUser = value;

  @observable
  String lastNameUser = "";

  @action
  void setLastNameUser(String value) => lastNameUser = value;
  
  @observable
  String nick = "";

  @action
  void setNick(String value) => nick = value;

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

  @action
  void clearValues(){
    firstNameUser = '';
    lastNameUser = '';
    nick = '';
    email = '';
    password = '';
  }

  @computed
  bool get isUserNickValid => firstNameUser.isNotEmpty && lastNameUser.isNotEmpty && nick.isNotEmpty;

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isEmailValid => RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(email);

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid && isUserNickValid;

}