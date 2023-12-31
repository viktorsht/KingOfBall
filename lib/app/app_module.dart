import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/lineup/lineup_module.dart';
import 'package:rei_da_bola/app/modules/login/login_module.dart';
import 'package:rei_da_bola/app/modules/register_user/register_module.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/home_module.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/ranking/ranking_module.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/pages/start_navigation_bar_page.dart';
import 'package:rei_da_bola/app/modules/team_virtual/team_virtual_module.dart';
import 'package:rei_da_bola/shared/api/api_headers.dart';
import 'package:rei_da_bola/app/modules/start_info/start_info_page.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/start_module.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';
import 'package:rei_da_bola/shared/auth/auth_controller.dart';
import 'package:rei_da_bola/shared/exit/exit_app.dart';
import 'package:rei_da_bola/shared/token/token_manager.dart';
import '../design_system/widgets/loading_app.dart';
import 'modules/register_user/controllers/register_user_controller.dart';
import 'modules/start_navigation_bar/modules/drawer/drawer_module.dart';
import 'modules/start_navigation_bar/modules/football_field/football_field_module.dart';
import 'modules/start_navigation_bar/modules/more/more_module.dart';
import 'modules/champion_ship/team_edition.dart';
import 'modules/update_team/update_user_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => DefaultHeadersApi()),
    Bind.singleton((i) => AuthController()),
    Bind.singleton((i) => TokenManager()),
    Bind.singleton((i) => ExitApp()),
    Bind.singleton((i) => RegisterController()),
  ];

  @override
  List<ModularRoute> get routes => [
    
    ChildRoute(
      RoutesModulesApp.routerRootModule,
      child: (_, __) => FutureBuilder<bool>(
        future: Modular.get<AuthController>().checkAuthenticated(),
        builder: (_, snapshot){
          return snapshot.connectionState == ConnectionState.waiting ? const LoadingApp() : snapshot.hasData 
          ? snapshot.data! ? const StartNavigationBarPage() : const StartInfoPage()
          : const StartInfoPage();
        }
      ),
    ),

/*
    ChildRoute(
      RoutesModulesApp.routerRootModule, 
      child: (_, __) => const StartInfoPage(), 
    ),*/

    ModuleRoute(RoutesModulesApp.routerLoginModule, module: LoginModule()),
    ModuleRoute(RoutesModulesApp.routerRegisterModule, module: RegisterModule()),
    ModuleRoute(RoutesModulesApp.routerStartNavigationBarModule, module: StartNavigationBarModule()),
    ModuleRoute(RoutesModulesApp.routerTeamVirtualModule, module: TeamVirtualModule()),
    ModuleRoute(RoutesModulesApp.routerHomeModule, module: HomeModule()),
    ModuleRoute(RoutesModulesApp.routerDrawerModule, module: DrawerModule()),
    ModuleRoute(RoutesModulesApp.routerMoreModule, module: MoreModule()),
    ModuleRoute(RoutesModulesApp.routerRegisterTeamEditionModule, module: TeamEditionModule()),
    ModuleRoute(RoutesModulesApp.routerLineUpModule, module: LineUpModule()),
    ModuleRoute(RoutesModulesApp.routerUpdateUserModule, module: UpdateTeamModule()),
    ModuleRoute(RoutesModulesApp.routerFootbolFielModule, module: FootballFieldModule()),
    ModuleRoute(RoutesModulesApp.routerRankingModule, module: RankingModule()),

  ];
}