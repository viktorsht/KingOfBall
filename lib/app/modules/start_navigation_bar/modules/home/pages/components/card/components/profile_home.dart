import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 60,
          child: Image.asset(
            ImagesApp.escudoTeam
            )
          ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "River Futebol Club FC",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "@mr.santos",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                //color: colors.gray
              ),
            ),
          ],
        )
      ],
    );
  }
}