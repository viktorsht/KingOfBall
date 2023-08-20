import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/ranking/controllers/ranking_controller.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/ranking/pages/ranking_page.dart';

import '../../../../routes/routes_app.dart';

class RankingModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => RankingController())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(RoutesModulesApp.routerRootModule, child: (context, args) => RankingPage(
      edition: args.params['edition'],
    )),
  ];

}