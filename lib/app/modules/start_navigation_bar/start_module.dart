import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/pages/start_navigation_bar_page.dart';

class StartNavigationBarModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const StartNavigationBarPage()),
  ];

}