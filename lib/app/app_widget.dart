import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/buy/stories/buy_store.dart';
import 'package:rei_da_bola/app/modules/login/stories/login_store.dart';
import 'package:rei_da_bola/app/modules/register_user/stories/register_store.dart';

import 'modules/login/controllers/login_controller.dart';
import 'modules/register_user/controllers/register_user_controller.dart';
import 'modules/start_navigation_bar/modules/home/controller/card_profile_controller.dart';
import 'modules/team_virtual/modules/register/controller/register_team_virtual_controller.dart';
import 'modules/team_virtual/modules/register/stories/team_virtual_register_store.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginController>(create: (_) => LoginController(),),
        Provider<LoginStore>(create: (_) => LoginStore(),),
        Provider<RegisterController>(create: (_) => RegisterController(),),
        Provider<RegisterStore>(create: (_) => RegisterStore(),),
        Provider<TeamVirtualRegisterStore>(create: (_) => TeamVirtualRegisterStore(),),
        Provider<RegisterTeamVirtualController>(create: (_) => RegisterTeamVirtualController(),),
        Provider<CardProfileController>(create: (_) => CardProfileController()),
        Provider<BuyStore>(create: (_) => BuyStore())
      ],
      child: MaterialApp.router(
        title: 'Rei da Bola',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
      ),
    );
  }
}