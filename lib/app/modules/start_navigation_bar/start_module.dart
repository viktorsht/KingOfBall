import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/home_module.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/pages/start_navigation_bar_page.dart';

import '../../routes/routes_app.dart';

class StartNavigationBarModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const StartNavigationBarPage()),
    ModuleRoute(RoutesModulesApp.routerHomePage, module: HomeModule()),
  ];

}