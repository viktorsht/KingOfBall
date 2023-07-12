import 'package:flutter/material.dart';
import 'package:rei_da_bola/app/modules/shared/models/user_model.dart';

import '../../../../../../../../design_system/icons/icons_app.dart';
import '../../../../../../../../design_system/images/images_app.dart';

class CardProfile extends StatelessWidget {
  
  final UserModel userModel;

  const CardProfile({
    super.key, 
    required this.userModel, 
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
                const Text(
                  "River Futebol Club FC",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "@${userModel.nick}",
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