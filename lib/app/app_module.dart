import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/login/login_module.dart';
import 'package:rei_da_bola/app/modules/register/register_module.dart';
import 'package:rei_da_bola/app/modules/shared/api/api_headers.dart';
import 'package:rei_da_bola/app/modules/start_info/start_info_page.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/start_module.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => DefaultHeadersApi()),
    AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()), // eu n sei pq isso esta aqui n kkk
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      RoutesModulesApp.routerRootModule,
        child: (context, args) => const StartInfoPage(),
    ),
    ModuleRoute(RoutesModulesApp.routerLoginModule, module: LoginModule()),
    ModuleRoute(RoutesModulesApp.routerRegisterModule, module: RegisterModule()),
    ModuleRoute(RoutesModulesApp.routerStartNavigationBarModule, module: StartNavigationBarModule()),
  ];
}