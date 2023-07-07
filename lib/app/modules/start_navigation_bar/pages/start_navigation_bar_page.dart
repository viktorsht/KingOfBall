import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/pages/components/navigator_component.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/stories/navigation_store.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';

import 'components/card_profile.dart';

class StartNavigationBarPage extends StatefulWidget {
  const StartNavigationBarPage({super.key});

  @override
  State<StartNavigationBarPage> createState() => _StartNavigationBarPageState();
}

class _StartNavigationBarPageState extends State<StartNavigationBarPage> {

  late NavigationStore navigationStore;
/*
  @override
  void dispose() {
    super.dispose();
    navigationStore = NavigationStore();
  }*/

  @override
  void initState() {
    super.initState();
    navigationStore = NavigationStore();
    navigationStore.setPageController(PageController());
  }

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.green,
        centerTitle: true,
        elevation: 0.0,
        title: Image.asset(
          ImagesApp.brasaoTeam,
          height: 50,
        ),
      ),
      body: Center(
        child: Observer(
          builder: (_) => PageView(
            controller: navigationStore.pageController,
            children: [
              const CardProfile(),
              Container(color: Colors.amber,),
              Container(color: Colors.red,),
              Container(color: Colors.blue,)
            ],
          )
        ),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: navigationStore.pageController,
        builder: (context, snapshot) {
          return NavigatorComponent(
            color: colors,
            navigationStore: navigationStore,
          );
        }
      )

    );
  }
}