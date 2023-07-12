import 'package:flutter_modular/flutter_modular.dart';

import '../../app/routes/routes_app.dart';

class ChangeAccountApp{
  void changeAccount() {
    Modular.to.navigate(RoutesModulesApp.routerLoginModule);
  }
}