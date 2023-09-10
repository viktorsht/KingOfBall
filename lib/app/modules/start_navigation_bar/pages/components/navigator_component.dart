import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

class NavigatorComponent extends StatelessWidget {

  final PageController pageController;
  
  const NavigatorComponent({
    super.key, 
    required this.pageController
  });

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    return Observer(
      builder: (_) => Theme(
        data: Theme.of(context).copyWith(
          canvasColor: colors.green
        ),
        child: BottomNavigationBar(
          //backgroundColor: color.green,
          type: BottomNavigationBarType.fixed,
          currentIndex: pageController.page?.round() ?? 0,
          onTap: (index) => pageController.jumpToPage(index),
          selectedItemColor: colors.white,
          unselectedItemColor: colors.white54,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.table_chart),
              label: 'Tabela',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Equipe',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Mais',
            ),
          ],
        ),
      ),
    );
  }
}