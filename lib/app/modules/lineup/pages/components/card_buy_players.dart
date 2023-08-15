import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rei_da_bola/app/modules/lineup/models/lu_player_lineup_model.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

class CardBuyPlayers extends StatelessWidget {
  
  final ColorsAppDefault color;
  final String image;
  //final String score;
  final PlayerLineUpModel player;
  
  const CardBuyPlayers({
    super.key, 
    required this.color, 
    required this.image, 
    //required this.score,
    required this.player, 
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
                player.playerEdition?.player?.firstName == null || player.playerEdition?.player?.lastName == null
                ? 'Carregando...' 
                : '${player.playerEdition?.player!.firstName!} ${player.playerEdition?.player?.lastName}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                //'$positionAbb - $nameTeam',
                player.playerEdition?.teamEdition?.team?.name == null || player.playerEdition?.player?.position?.abb == null
                ? 'Carregando...' 
                : '${player.playerEdition?.player?.position?.abb} - ${player.playerEdition?.teamEdition?.team?.name}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'B\$ ${player.score}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Text(
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
              onPressed: (){
                //Player
                //PlayerLineupModel newPlayerSelect = playerEditionModel.playerEdition;
                /*
                if(teamController.isChange == false){
                  //store.addPlayerToVirtualTeam(newPlayerSelect);
                }
                else{
                  teamController.setIsChange();
                  store.updateList(teamController.playerList);
                  teamController.updateList(store.teamList);
                  //store.updatePlayer(newPlayerSelect);
                  //ok == true ? print('ok') : print('erro');

                }
                //store.setTeamList(playerEditionModel);
                //print(store.stateStoreBuy);
                if (store.stateStoreBuy == StateResponse.sucess || teamController.isChange == true){
                  final snackbar = SnackBar(
                    content: const Text('Selecionado com sucesso!'),
                    duration: const Duration(seconds: 1),
                    backgroundColor: color.green,
                    action: SnackBarAction(
                      backgroundColor: color.whiteLigth,
                      textColor: color.black,
                      label: 'Desfazer',
                      onPressed: () {
                        // Ação a ser executada quando o botão "Desfazer" é pressionado
                        // (pode ser vazia ou uma ação específica)
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);

                }
                else{
                  final snackbar = SnackBar(
                    content: const Text('Vaga de jogador preenchida!'),
                    duration: const Duration(seconds: 1),
                    backgroundColor: color.red,
                    action: SnackBarAction(
                      backgroundColor: color.whiteLigth,
                      textColor: color.black,
                      label: 'Trocar',
                      onPressed: () {
                        // Ação a ser executada quando o botão "Desfazer" é pressionado
                        // (pode ser vazia ou uma ação específica)
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
                store.clearState();
*/
              }, 
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