import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import '../../../start_navigation_bar/modules/football_field/models/player_edition_model.dart';

class CardBuyPlayers extends StatelessWidget {
  
  final ColorsAppDefault color;
  final String image;
  //final String? namePlayer;
  //final String? positionAbb;
  //final String? nameTeam;
  final PlayerEditionModel playerEdition;
  
  const CardBuyPlayers({
    super.key, 
    required this.color, 
    required this.image, 
    required this.playerEdition
  });

  @override
  Widget build(BuildContext context) {
    //final store = Provider.of<BuyStore>(context);
    //final teamController = Provider.of<TeamController>(context);

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
                playerEdition.player?.firstName == null || playerEdition.player?.lastName == null
                ? 'Carregando...' 
                : '${playerEdition.player!.firstName!} ${playerEdition.player?.lastName}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                //'$positionAbb - $nameTeam',
                playerEdition.teamEdition?.team?.name == null || playerEdition.player?.position?.abb == null
                ? 'Carregando...' 
                : '${playerEdition.player?.position?.abb} - ${playerEdition.teamEdition?.team?.name}',
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