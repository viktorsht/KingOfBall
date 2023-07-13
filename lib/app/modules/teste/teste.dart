import 'package:flutter/material.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/pages/components/football_field/player.dart';

import '../../../design_system/images/images_app.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double fieldH = 0.6773399 * height;
    return Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
               SizedBox(
                  height: fieldH,
                  width: width,
                  child: Image.asset(
                    ImagesApp.footballField, fit: BoxFit.fill
                  ),
                ),
                Player(image: 'assets/teste/gk.png', name: 'Lala', top: 0.07272727 * fieldH, right: 0.0, left: 0.0, position: "GK"),
                Player(image: ImagesApp.jogador1, name: 'Ay Jand', top: 0.21818182 * fieldH, right: 0.70666667 * width, left: 0.0, position: "RB"),
                Player(image: ImagesApp.jogador2, name: 'Wole', top: 0.23636364 * fieldH, right: 0.29333333 * width, left: 0.0, position: "CB"),
                Player(image: ImagesApp.jogador3, name: 'Big Ay', top: 0.23636364 * fieldH, right: 0.0, left: 0.29333333 * width, position: "CB"),
                Player(image: ImagesApp.jogador3, name: 'George', top: 0.21818182 * fieldH,right: 0.0, left: 0.70666667 * width, position: "LB"),
                Player(image: ImagesApp.jogador3, name: 'Prince', top: 0.47272727 * fieldH, right: 0.0, left: 0.70666667 * width, position: "LMF"),
                Player(image: ImagesApp.jogador3, name: 'Tayo', top: 0.45454545 * fieldH, right: 0.01333333 * width, left: 0.0, position: "AMF"),
                Player(image: ImagesApp.jogador3, name: 'Efosa', top: 0.47272727 * fieldH, right: 0.70666667 * width, left: 0.0, position: "RMF"),
                Player(image: ImagesApp.jogador3, name: 'Elijah', top: 0.69090909 * fieldH, right: 0.29333333 * width, left: 0.29333333 * width, position: "CF"),
                Player(image: ImagesApp.jogador3, name: 'Iyanu', top: 0.69090909 * fieldH, right: 0.44 * width, left: 0.0, position: "RWF"),
                Player(image: ImagesApp.jogador3, name: 'Tomisin', top: 0.69090909 * fieldH, right: 0.17333333 * width, left: 0.65333333 * width, position: "LWF"),
                Player(image: ImagesApp.jogador2, name: 'Efosa', top: 0.79090909 * fieldH, right: 0.70666667 * width, left: 0.0, position: "RMF"),
              ]
            ),
          ]
        )
      )
    );
  }
}