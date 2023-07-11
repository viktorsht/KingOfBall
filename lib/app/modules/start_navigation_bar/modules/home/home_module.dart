import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/pages/home_page.dart';

import '../../../../routes/routes_app.dart';


class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(RoutesModulesApp.routerRootModule, child: (context, args) => const HomePage()),
    //ModuleRoute(RoutesModulesApp.routerRootModule, module: TeamVirtualRegisterModule()),
  ];

}