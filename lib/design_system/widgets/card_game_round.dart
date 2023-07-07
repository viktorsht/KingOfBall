import 'package:flutter/material.dart';

import '../colors/colors_app.dart';

class CardGameRound extends StatelessWidget {

  /*
  CardGameRound(
                color: colors,
                pathFristTeam: ImagesApp.escudoTeam,
                nameFristTeam: 'Almesqueira',
                pathSecondTeam: ImagesApp.escudoTeam,
                nameSecondTeam: 'Curral Velho',
                gameTime: 'DOM 16:00',

              )
  */
  
  final ColorsAppDefault color;
  final String pathFristTeam;
  final String nameFristTeam;
  final String pathSecondTeam;
  final String nameSecondTeam;
  final String gameTime;


  const CardGameRound({
    super.key, 
    required this.color, 
    required this.pathFristTeam, 
    required this.nameFristTeam, 
    required this.pathSecondTeam, 
    required this.nameSecondTeam, 
    required this.gameTime
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.whiteLigth,
        borderRadius: BorderRadius.circular(25),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            pathFristTeam,
            height: 60,
          ),
          Text(
            nameFristTeam,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "X", 
                style: TextStyle(
                  color: color.green,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
            Text(
              gameTime,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            ],
          ),
          Text(
            nameSecondTeam,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Image.asset(
            pathSecondTeam,
            height: 60,
          ),
        ],
      ),
    );
  }
}