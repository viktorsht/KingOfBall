import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/login/login_module.dart';
import 'package:rei_da_bola/app/modules/login/pages/login_page.dart';
import 'package:rei_da_bola/app/modules/register/register_module.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/pages/start_navigation_bar_page.dart';
import 'package:rei_da_bola/shared/api/api_headers.dart';
import 'package:rei_da_bola/app/modules/start_info/start_info_page.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/start_module.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';
import 'package:rei_da_bola/shared/auth/auth_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => DefaultHeadersApi()),
    Bind.singleton((i) => AuthController()),
  ];

  @override
  List<ModularRoute> get routes => [

    ChildRoute(
      RoutesModulesApp.routerRootModule,
      child: (_, __) => FutureBuilder<bool>(
        future: Modular.get<AuthController>().checkTokenValidity(),
        builder: (_, snapshot){
          return snapshot.hasData
          ? snapshot.data! ? const StartNavigationBarPage() : const LoginPage()
          : const StartInfoPage();
        }
      ),
    ),

    ModuleRoute(RoutesModulesApp.routerLoginModule, module: LoginModule()),
    ModuleRoute(RoutesModulesApp.routerRegisterModule, module: RegisterModule()),
    ModuleRoute(RoutesModulesApp.routerStartNavigationBarModule, module: StartNavigationBarModule()),
  ];
}