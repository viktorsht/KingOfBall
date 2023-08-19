
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/controllers/football_filed_controller.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/stories/football_field_store.dart';

import '../../../../routes/routes_app.dart';
import 'pages/football_field_page.dart';

class FootballFieldModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => FootballFieldController()),
    Bind((i) => FootballFieldStore())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(RoutesModulesApp.routerRootModule, child: (_, args) => const FootballFieldPage()),  
  ];

}