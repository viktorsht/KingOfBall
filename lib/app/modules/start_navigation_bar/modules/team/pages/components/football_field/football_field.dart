import 'package:flutter/material.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/pages/components/football_field/player.dart';

import '../../../../../../../../design_system/images/images_app.dart';

class FootballField extends StatelessWidget {
  final double width;
  final double height;
  final double fieldH;

  const FootballField({
    super.key, 
    required this.width, 
    required this.height, 
    required this.fieldH
    });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            SizedBox(
              height: fieldH,
              width: width,
              child: Image.asset(
                ImagesApp.footballField,
                fit: BoxFit.fill,
              ),
            ),
            Player(
                image: ImagesApp.goleiro,
                name: 'Lala1',
                top: 0.07272727 * fieldH,
                right: 0.0,
                left: 0.0,
                position: "GOL",
              ),
            Player(
              image: ImagesApp.addUser,
              name: 'Alberto',
              top: 0.21818182 * fieldH,
              right: 0.70666667 * width,
              left: 0.0,
              position: "LAT",
            ),
            Player(
              image: ImagesApp.jogador2,
              name: 'Wole3',
              top: 0.23636364 * fieldH,
              right: 0.29333333 * width,
              left: 0.0,
              position: "ZAG",
            ),
            Player(
              image: ImagesApp.jogador3,
              name: 'Big Ay',
              top: 0.23636364 * fieldH,
              right: 0.0,
              left: 0.29333333 * width,
              position: "ZAG",
            ),
            Player(
              image: ImagesApp.jogador2,
              name: 'George',
              top: 0.21818182 * fieldH,
              right: 0.0,
              left: 0.70666667 * width,
              position: "LAT",
            ),
            Player(
              image: ImagesApp.jogador1,
              name: 'Albert1',
              top: 0.47272727 * fieldH,
              right: 0.16333333 * width,
              left: 0.65333333 * width,
              position: "VOL",
            ),
            Player(
              image: ImagesApp.jogador2,
              name: 'Tayo',
              top: 0.45454545 * fieldH,
              right: 0.01333333 * width,
              left: 0.0,
              position: "MEI",
            ),
            Player(
              image: ImagesApp.jogador3,
              name: 'Alfredo',
              top: 0.47272727 * fieldH,
              right: 0.47 * width,
              left: 0.0,
              position: "VOL",
            ),
            Player(
              image: ImagesApp.jogador1,
              name: 'Elijah',
              top: 0.69090909 * fieldH,
              right: 0.29333333 * width,
              left: 0.29333333 * width,
              position: "ATA",
            ),
            Player(
              image: ImagesApp.jogador2,
              name: 'Iyanu',
              top: 0.69090909 * fieldH,
              right: 0.44 * width,
              left: 0.0,
              position: "ATA",
            ),
            Player(
              image: ImagesApp.jogador3,
              name: 'Tomisin',
              top: 0.69090909 * fieldH,
              right: 0.17333333 * width,
              left: 0.65333333 * width,
              position: "ATA",
            ),
            Player(
              image: ImagesApp.tecnico,
              name: 'TÉCNICO',
              top: 0.79090909 * fieldH,
              right: 0.75666667 * width,
              left: 0.0,
              position: "TEC",
            ),
          ],
        ),
      ],
    );
  }
}