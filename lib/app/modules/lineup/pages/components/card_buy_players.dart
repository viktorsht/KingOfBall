import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/lineup/models/player_lineup_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/stories/football_field_store.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import '../../../shared/config/config_controller.dart';

class CardBuyPlayers extends StatelessWidget {
  
  final ColorsAppDefault color;
  final String image;
  final PlayerLineUpModel player;
  
  const CardBuyPlayers({
    super.key, 
    required this.color, 
    required this.image, 
    required this.player, 
  });

  @override
  Widget build(BuildContext context) {
    final configController = Provider.of<ConfigController>(context);
    final footballFieldStore = Provider.of<FootballFieldStore>(context);
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
                player.player?.firstName == null || player.player?.lastName == null
                ? 'Carregando...' 
                : '${player.player!.firstName!} ${player.player?.lastName} Nº ${player.player?.number}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                //'$positionAbb - $nameTeam',
                player.teamEdition?.team?.name == null || player.player?.position?.abb == null
                ? 'Carregando...' 
                : '${player.player?.position?.abb} - ${player.teamEdition?.team?.name}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
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
              onPressed: footballFieldStore.isValidButton(player.id!) 
              ? null
              : () {
                configController.listPlayerLineUp(player);
                Navigator.pop(context);
              },
              child: const Text(
                "Selecionar",
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