
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../routes/routes_app.dart';
import 'pages/football_field_page.dart';

class TeamModule extends Module {
  @override
  List<Bind> get binds => [
    //Bind.lazySingleton((i) => BuyStore()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(RoutesModulesApp.routerRootModule, child: (_, args) => FootballFieldPage(
        round: args.params['round'], 
        team: args.params['team'],
      )
    ),  
  ];

}