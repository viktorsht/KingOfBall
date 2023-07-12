import 'package:flutter/services.dart';

class ExitApp{
  void exitToApp() {
    //Modular.to.popUntil(ModalRoute.withName(Modular.initialRoute));
    //Modular.to.pop();
    //Modular.to.navigate(Modular.initialRoute);
    SystemNavigator.pop();
  }
}