import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/pages/components/football_field/player.dart';
import '../../../../../../../../design_system/images/images_app.dart';
import '../../../../../../shared/config/models/config_model.dart';
import '../../../stories/football_field_store.dart';

class FootballField extends StatelessWidget {
  final double width;
  final double height;
  final double fieldH;
  final List<ConfigLineUpPlayer> listPlayer;

  const FootballField({
    super.key, 
    required this.width, 
    required this.height, 
    required this.fieldH, 
    required this.listPlayer, 
  });

  @override
  Widget build(BuildContext context) {
    //final storeTeam = FootballFieldStore();
    //final config = Provider.of<ConfigController>(context);
    final storeTeam = Provider.of<FootballFieldStore>(context);
    
    //print(storeTeam.idPlayerList);
    return ListView(
      children: [
        Observer(
          builder: (context) {
            storeTeam.idPlayerList = [];
            return Stack(
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
                  image: storeTeam.playerGol(listPlayer, 'GOL'),
                  player: storeTeam.playerName(listPlayer, 'GOL'),
                  top: 0.07272727 * fieldH,
                  right: 0.0,
                  left: 0.0,
                  position: "Goleiro",
                ),
                Player(
                  image: storeTeam.player1(listPlayer, 'LAT'),
                  player: storeTeam.playerName(listPlayer, 'LAT'),
                  top: 0.21818182 * fieldH,
                  right: 0.70666667 * width,
                  left: 0.0,
                  position: "Lateral",
                ),
                Player(
                  image: storeTeam.player2(listPlayer, 'ZAG'),
                  player: storeTeam.playerName(listPlayer, 'ZAG'),
                  top: 0.23636364 * fieldH,
                  right: 0.29333333 * width,
                  left: 0.0,
                  position: "Zagueiro",
                ),
                Player(
                  image: storeTeam.player3(listPlayer, 'ZAG'),
                  player: storeTeam.playerName(listPlayer, 'ZAG'),
                  top: 0.23636364 * fieldH,
                  right: 0.0,
                  left: 0.29333333 * width,
                  position: "Zagueiro",
                ),
                Player(
                  image: storeTeam.player1(listPlayer, 'LAT'),
                  player: storeTeam.playerName(listPlayer, 'LAT'),
                  top: 0.21818182 * fieldH,
                  right: 0.0,
                  left: 0.70666667 * width,
                  position: "Lateral",
                ),
                Player(
                  image: storeTeam.player2(listPlayer, 'MEI'),
                  player: storeTeam.playerName(listPlayer, 'MEI'),
                  top: 0.47272727 * fieldH,
                  right: 0.16333333 * width,
                  left: 0.65333333 * width,
                  position: "Meio-campista",
                ),
                Player(
                  image: storeTeam.player3(listPlayer, 'MEI'),
                  player: storeTeam.playerName(listPlayer, 'MEI'),
                  top: 0.45454545 * fieldH,
                  right: 0.01333333 * width,
                  left: 0.0,
                  position: "Meio-campista",
                ),
                Player(
                  image: storeTeam.player1(listPlayer, 'MEI'),
                  player: storeTeam.playerName(listPlayer, 'MEI'),
                  top: 0.47272727 * fieldH,
                  right: 0.47 * width,
                  left: 0.0,
                  position: "Meio-campista",
                ),
                Player(
                  image: storeTeam.player2(listPlayer, 'ATA'),
                  player: storeTeam.playerName(listPlayer, 'ATA'),
                  top: 0.69090909 * fieldH,
                  right: 0.29333333 * width,
                  left: 0.29333333 * width,
                  position: "Atacante",
                ),
                Player(
                  image: storeTeam.player3(listPlayer, 'ATA'),
                  player: storeTeam.playerName(listPlayer, 'ATA'),
                  top: 0.69090909 * fieldH,
                  right: 0.44 * width,
                  left: 0.0,
                  position: "Atacante",
                ),
                Player(
                  image: storeTeam.player1(listPlayer, 'ATA'),
                  player: storeTeam.playerName(listPlayer, 'ATA'),
                  top: 0.69090909 * fieldH,
                  right: 0.17333333 * width,
                  left: 0.65333333 * width,
                  position: "Atacante",
                ),
              ],
            );
          }
        ),
      ],
    );
  }
}