import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/shared/config/config_controller.dart';
import 'package:rei_da_bola/app/modules/shared/score/controllers/score_controller.dart';
import 'package:rei_da_bola/app/modules/shared/user/controller/user_controller.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/pages/football_field_page.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/pages/home_page.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/pages/components/navigator_component.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/stories/navigation_store.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';
import 'package:rei_da_bola/design_system/widgets/loading_app.dart';
import '../../shared/round_roday/controller/round_today_controller.dart';
import '../modules/drawer/pages/drawer_page.dart';
import '../modules/more/pages/more_page.dart';
import '../modules/ranking/pages/ranking_page.dart';

class StartNavigationBarPage extends StatefulWidget {
  const StartNavigationBarPage({super.key});

  @override
  State<StartNavigationBarPage> createState() =>
      _StartNavigationBarPageState();
}

class _StartNavigationBarPageState extends State<StartNavigationBarPage> {
  late NavigationStore navigationStore;
  final pageViewController = PageController();
  final userController = UserController();
  final roundTodayController = RoundTodayController();
  final scoreController = ScoreController();

  Future<void> fetchData() async {
    await userController.initUserInfomations();
    await roundTodayController.initRoundToday();
    await scoreController.setMyScoreTeam();
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    final configController = Provider.of<ConfigController>(context);

    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingApp();
        } else if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Error while loading data'), // Error message
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: colors.green,
              centerTitle: true,
              elevation: 0.0,
              title: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset(
                  ImagesApp.brasaoTeam,
                  height: 50,
                ),
              ),
            ),
            drawer: Observer(
              builder: (context) => DrawerPage(
                colors: colors,
                user: userController.team.user!, // pode dar problema por ser não nulo - trocar por startController.user
              ),
            ),
            body: Observer(
              builder: (context) {
                return Center(
                  child: PageView(
                    controller: pageViewController,
                    children: [
                      HomePage(
                        teamGameModel: userController.team,
                        soccerMatchModel: roundTodayController.round,
                        pageController: pageViewController,
                        scoreModel: scoreController.myScoreTeam,
                      ),
                      Observer(
                        builder: (context) {
                          return RankingPage(edition: roundTodayController.round.championshipEditionId!);
                        }
                      ),
                      Observer(
                        builder: (context) {
                          configController.setEdition(roundTodayController.round.championshipEditionId!);
                          configController.setRound(roundTodayController.round.championshipRound!.id!);
                          configController.setTeam(userController.team.id!);
                          configController.setDateTime(roundTodayController.round.dateTime);
                          return FootballFieldPage(
                            round: roundTodayController.round.championshipRound!.id!,
                            team: userController.team.id!, 
                            edition: roundTodayController.round.championshipEditionId!, 
                          );
                        }
                      ),
                      Observer(
                        builder: (context) {
                          return MorePage(edition: roundTodayController.round.championshipEditionId!);
                        }
                      ),
                    ],
                  ),
                );
              }
            ),
            bottomNavigationBar: AnimatedBuilder(
              animation: pageViewController,
              builder: (context, snapshot) {
                return NavigatorComponent(
                  color: colors,
                  pageController: pageViewController,
                );
              }
            )
          );
        }
      },
    );
  }
}
