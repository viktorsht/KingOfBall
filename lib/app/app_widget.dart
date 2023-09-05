import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/shared/config/config_controller.dart';
import 'package:rei_da_bola/app/modules/shared/score/stories/score_store.dart';
import 'modules/lineup/controllers/lineup_controller.dart';
import 'modules/login/controllers/login_controller.dart';
import 'modules/register_user/controllers/register_user_controller.dart';
import 'modules/shared/score/controllers/score_controller.dart';
import 'modules/start_navigation_bar/modules/football_field/controllers/football_filed_controller.dart';
import 'modules/start_navigation_bar/modules/football_field/stories/football_field_store.dart';
import 'modules/start_navigation_bar/modules/home/controller/card_profile_controller.dart';
import 'modules/team_virtual/modules/register/controller/register_team_virtual_controller.dart';
import 'modules/update_team/controllers/update_team_controller.dart';
import 'modules/update_team/stories/update_team_store.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginController>(create: (_) => LoginController(),),
        Provider<RegisterController>(create: (_) => RegisterController(),),
        Provider<RegisterTeamVirtualController>(create: (_) => RegisterTeamVirtualController(),),
        Provider<CardProfileController>(create: (_) => CardProfileController()),
        Provider<FootballFieldController>(create: (_) => FootballFieldController()),
        Provider<LineUpController>(create: (_) => LineUpController()),
        Provider<ConfigController>(create: (_) => ConfigController()),
        Provider<FootballFieldStore>(create: (_) => FootballFieldStore()),
        Provider<ScoreController>(create: (_) => ScoreController()),
        Provider<ScoreStore>(create: (_) => ScoreStore()),
        Provider<UpdateTeamController>(create: (_) => UpdateTeamController()),
        Provider<UpdateTeamStore>(create: (_) => UpdateTeamStore()),
      ],
      child: MaterialApp.router(
        title: 'Rei da Bola',
        debugShowCheckedModeBanner: false,
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
      ),
    );
  }
}