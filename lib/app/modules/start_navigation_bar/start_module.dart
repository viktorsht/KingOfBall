import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/shared/score/controllers/score_controller.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/drawer/drawer_module.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/home_module.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/pages/start_navigation_bar_page.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/stories/navigation_store.dart';

import '../../routes/routes_app.dart';
import '../shared/round_roday/controller/round_today_controller.dart';
import '../shared/user/controller/user_controller.dart';
import 'modules/more/more_module.dart';

class StartNavigationBarModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => UserController()),
    Bind((i) => RoundTodayController()),
    Bind((i) => ScoreController()),
    Bind((i) => NavigationStore())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(RoutesModulesApp.routerRootModule, child: (context, args) => const StartNavigationBarPage()),
    ModuleRoute(RoutesModulesApp.routerHomeModule, module: HomeModule()),
    ModuleRoute(RoutesModulesApp.routerDrawerModule, module: DrawerModule()),
    ModuleRoute(RoutesModulesApp.routerMoreModule, module: MoreModule()),
  ];

}