import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

class CardBuyPlayers extends StatelessWidget {
  
  final ColorsAppDefault color;
  final String image;
  final String namePlayer;
  final String positionAbb;
  final String nameTeam;
  final int numb;
  
  const CardBuyPlayers({
    super.key, 
    required this.color, 
    required this.namePlayer, 
    required this.positionAbb, 
    required this.nameTeam, 
    required this.image, required this.numb
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.whiteLigth,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            image,
            height: 60,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                namePlayer,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '$positionAbb - $nameTeam',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'B\$ 16.80',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                'Preço',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              // talvez seja preciso mudar a cor do botão dependendo do valor que o cara tiver
              backgroundColor: color.green, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            onPressed: (){}, 
            child: const Text(
                  "COMPRAR",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  ),
                ),
                /*
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 2
                  ),
                  child: Icon(
                    Icons.done,
                    size: 18,
                    weight: 50,
                  ),
                ),
                Text(
                  "COMPRAR",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 2
                  ),
                  child: Icon(
                    Icons.done,
                    size: 18,
                    weight: 12,
                  ),
                ),
              ],
            ),
                */
          ),
        ],
      ),
    );
  }
}