import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/pages/home_page.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/table/pages/table_page.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/pages/team_page.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/pages/components/navigator_component.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/stories/navigation_store.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';

import '../../../../shared/token/token_manager.dart';
import '../modules/drawer/pages/drawer_page.dart';
import '../modules/home/controller/card_profile_controller.dart';


class StartNavigationBarPage extends StatefulWidget {
  const StartNavigationBarPage({super.key});

  @override
  State<StartNavigationBarPage> createState() => _StartNavigationBarPageState();
}

class _StartNavigationBarPageState extends State<StartNavigationBarPage> {

  late NavigationStore navigationStore;
  
  final pageViewController = PageController();
  final cardProfileController = CardProfileController(); // esta aqui pro causa do Drawer

  @override
  void initState() {
    super.initState();
    final tokenManager = TokenManager();
    cardProfileController.initProfile(tokenManager);
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
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
        builder: (_) => DrawerPage(
          colors: colors,
          user: cardProfileController.user,
        ),
      ),
      body: Center(
        child: Observer(
          builder: (_) => PageView(
            controller: pageViewController,
            children: [
              HomePage(cardProfileController: cardProfileController,),
              const TablePage(),
              const TeamPage(),
              //Container(color: Colors.yellow,),
              Container(color: Colors.blue,),
              Container(color: Colors.black,),
            ],
          )
        ),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: pageViewController,
        builder: (context, snapshot) {
          return NavigatorComponent(
            color: colors,
            navigationStore: pageViewController,
          );
        }
      )

    );
  }
}