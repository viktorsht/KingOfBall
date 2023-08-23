import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/update_team/pages/update_user_page.dart';

import '../../routes/routes_app.dart';

class UpdateTeamModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(RoutesModulesApp.routerRootModule, child: (context, args) => UpdateTeamPage(
        team: args.data['team'],
        name: args.data['name'],
        abb: args.data['abb'],
      ),
    ),
  ];

}