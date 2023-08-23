import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

import '../../../../../../../../design_system/icons/icons_app.dart';
import '../../../../../../../../design_system/images/images_app.dart';
import '../../../../../../../../design_system/widgets/widget_loading.dart';
import '../../../../../../../routes/routes_app.dart';

class CardProfile extends StatelessWidget {
  
  final TeamGameModel teamGameModel;

  const CardProfile({
    super.key, 
    required this.teamGameModel, 
  });

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();  
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: Image.asset(
                ImagesApp.escudoTeam
                )
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(
                  builder:(_) => 
                  teamGameModel.name ==  null 
                  ? WidgetLoading(width: 5, thickness: 0.5, color: colors.black,)
                  : Text(
                    "${teamGameModel.name}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Observer(
                  builder:(_) => 
                  teamGameModel.user?.nick ==  null 
                  ? WidgetLoading(width: 5, thickness: 0.5, color: colors.black,)
                  : Text(
                    "@${teamGameModel.user!.nick}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      //color: colors.gray
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            Modular.to.navigate(
              RoutesModulesApp.routerUpdateUserModule, 
              arguments:{
                'team' : teamGameModel.id.toString(),
                'name' : teamGameModel.name,
                'abb' : teamGameModel.abb
              },
            );
          },
          child: Image.asset(IconsApp.editar,)
        ),
      ],
    );
  }
}