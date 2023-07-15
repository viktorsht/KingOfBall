import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/pages/home_page.dart';

import '../../../../routes/routes_app.dart';


class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    //Bind.singleton((i) => TeamGameModel()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      RoutesModulesApp.routerRootModule, child: (context, args) => HomePage(
        teamGameModel: TeamGameModel(),
      )
    ),
    //ModuleRoute(RoutesModulesApp.routerRootModule, module: TeamVirtualRegisterModule()),
  ];

}