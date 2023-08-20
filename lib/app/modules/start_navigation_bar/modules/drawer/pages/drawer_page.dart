import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/shared/user/models/user_model.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/icons/icons_app.dart';
import 'package:rei_da_bola/design_system/widgets/widget_loading.dart';
import 'package:rei_da_bola/shared/exit/exit_app.dart';

import '../../../../../routes/routes_app.dart';
import '../../../../shared/config/config_controller.dart';

class DrawerPage extends StatelessWidget {
  
  final ColorsAppDefault colors;
  final UserModel? user;
  
  const DrawerPage({
    super.key, 
    required this.colors, 
    required this.user
  });

  @override
  Widget build(BuildContext context) {
    final exitApp = ExitApp();
    final configController = Provider.of<ConfigController>(context);
    return Drawer(
      backgroundColor: colors.whiteLigth,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colors.green,
            ),
            child: user == null 
            ? const WidgetLoading(width: 6, thickness: 1)
            : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(IconsApp.userDrawer),
                Text(
                  'Olá, ${user!.firstName} ${user!.lastName}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '${user!.email}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Implement your navigation logic here
              Modular.to.pushNamed(RoutesModulesApp.routerStartNavigationBarModule);
              //Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('Sair'),
            onTap:(){
              exitApp.changeAccount();
              configController.clearListMap();
            } 
          ),/*
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: exitApp.exitToApp,
          ),*/
        ],
      ),
    );
  }
}