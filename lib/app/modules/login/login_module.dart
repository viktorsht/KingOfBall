import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/login/pages/login_page.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(RoutesModulesApp.routerRootModule, child: (context, args) => const LoginPage()),
  ];

}