import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/register/pages/register_page.dart';

class RegisterModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const RegisterPage()),
  ];

}