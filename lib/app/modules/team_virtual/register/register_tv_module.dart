import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/team_virtual/register/pages/team_virtual_register_page.dart';

class TeamVirtualRegisterModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const TeamVirtualRegisterPage()),
  ];

}