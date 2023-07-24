import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

import '../../models/buy_model.dart';
import '../../stories/buy_store.dart';

class CardBuyPlayers extends StatelessWidget {
  
  final ColorsAppDefault color;
  final String image;
  final String namePlayer;
  final String positionAbb;
  final String nameTeam;
  final BuyModel player;
  
  const CardBuyPlayers({
    super.key, 
    required this.color, 
    required this.namePlayer, 
    required this.positionAbb, 
    required this.nameTeam, 
    required this.image, 
    required this.player
  });

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<BuyStore>(context);
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
                player.player!.firstname!,
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
          Observer(
            builder:(_) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                // talvez seja preciso mudar a cor do botão dependendo do valor que o cara tiver
                backgroundColor: color.green, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              onPressed: store.isButtonValid ? (){ store.addPlayerToVirtualTeam(player);} : null, 
              child: const Text(
                "COMPRAR",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}