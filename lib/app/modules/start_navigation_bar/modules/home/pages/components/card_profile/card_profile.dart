import 'package:flutter/material.dart';
import 'package:rei_da_bola/app/modules/shared/models/user_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';

import '../../../../../../../../design_system/icons/icons_app.dart';
import '../../../../../../../../design_system/images/images_app.dart';

class CardProfile extends StatelessWidget {
  
  final TeamGameModel teamGameModel;

  const CardProfile({
    super.key, 
    required this.teamGameModel, 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //ProfileHome(tokenManager: tokenManager,),
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
                Text(
                  "River Futebool Clube FC",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "@1berto_jr",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    //color: colors.gray
                  ),
                ),
              ],
            )
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset(IconsApp.editar)
        ),
      ],
    );
  }
}