import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/stories/navigation_store.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

class NavigatorComponent extends StatelessWidget {

  final ColorsAppDefault color;
  final NavigationStore navigationStore;
  
  const NavigatorComponent({
    super.key, 
    required this.color, 
    required this.navigationStore
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Theme(
        data: Theme.of(context).copyWith(
          canvasColor: color.green
        ),
        child: BottomNavigationBar(
          //backgroundColor: color.green,
          type: BottomNavigationBarType.fixed,
          currentIndex: navigationStore.pageController.page?.round() ?? 0,
          onTap: (index) => navigationStore.pageController.jumpToPage(index),
          selectedItemColor: color.white,
          unselectedItemColor: color.gray,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Tabela',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Equipe',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Geral',
            ),
            /*
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Mais',
            ),
            */
          ],
        ),
      ),
    );
  }
}