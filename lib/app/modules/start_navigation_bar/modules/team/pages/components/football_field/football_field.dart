import 'package:flutter/material.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/pages/components/football_field/player.dart';
import '../../../../../../../../design_system/images/images_app.dart';
import '../../../stories/team_stories.dart';
import '../../../submodules/buy/models/player_edition_model.dart';

class FootballField extends StatelessWidget {
  final double width;
  final double height;
  final double fieldH;
  final List<PlayerEditionModel> listPlayer;

  const FootballField({
    super.key, 
    required this.width, 
    required this.height, 
    required this.fieldH, 
    required this.listPlayer
  });

  @override
  Widget build(BuildContext context) {
    final storeTeam = TeamStoriesController();
    //print(listPlayer);
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
              image: storeTeam.playerGol(listPlayer, 'GOL'),
              name: storeTeam.playerName(listPlayer, 'GOL'),
              top: 0.07272727 * fieldH,
              right: 0.0,
              left: 0.0,
              position: "GOL",
            ),
            Player(
              image: storeTeam.player1(listPlayer, 'LAT'),
              name: storeTeam.playerName(listPlayer, 'LAT'),
              top: 0.21818182 * fieldH,
              right: 0.70666667 * width,
              left: 0.0,
              position: "LAT",
            ),
            Player(
              image: storeTeam.player3(listPlayer, 'ZAG'),
              name: storeTeam.playerName(listPlayer, 'ZAG'),
              top: 0.23636364 * fieldH,
              right: 0.29333333 * width,
              left: 0.0,
              position: "ZAG",
            ),
            Player(
              image: storeTeam.player2(listPlayer, 'ZAG'),
              name: storeTeam.playerName(listPlayer, 'ZAG'),
              top: 0.23636364 * fieldH,
              right: 0.0,
              left: 0.29333333 * width,
              position: "ZAG",
            ),
            Player(
              image: storeTeam.player1(listPlayer, 'LAT'),
              name: storeTeam.playerName(listPlayer, 'LAT'),
              top: 0.21818182 * fieldH,
              right: 0.0,
              left: 0.70666667 * width,
              position: "LAT",
            ),
            Player(
              image: storeTeam.player3(listPlayer, 'MEI'),
              name: storeTeam.playerName(listPlayer, 'MEI'),
              top: 0.47272727 * fieldH,
              right: 0.16333333 * width,
              left: 0.65333333 * width,
              position: "MEI",
            ),
            Player(
              image: storeTeam.player2(listPlayer, 'VOL'),
              name: storeTeam.playerName(listPlayer, 'VOL'),
              top: 0.45454545 * fieldH,
              right: 0.01333333 * width,
              left: 0.0,
              position: "VOL",
            ),
            Player(
              image: storeTeam.player1(listPlayer, 'MEI'),
              name: storeTeam.playerName(listPlayer, 'MEI'),
              top: 0.47272727 * fieldH,
              right: 0.47 * width,
              left: 0.0,
              position: "MEI",
            ),
            Player(
              image: storeTeam.player3(listPlayer, 'ATA'),
              name: storeTeam.playerName(listPlayer, 'ATA'),
              top: 0.69090909 * fieldH,
              right: 0.29333333 * width,
              left: 0.29333333 * width,
              position: "ATA",
            ),
            Player(
              image: storeTeam.player2(listPlayer, 'ATA'),
              name: storeTeam.playerName(listPlayer, 'ATA'),
              top: 0.69090909 * fieldH,
              right: 0.44 * width,
              left: 0.0,
              position: "ATA",
            ),
            Player(
              image: storeTeam.player1(listPlayer, 'ATA'),
              name: storeTeam.playerName(listPlayer, 'ATA'),
              top: 0.69090909 * fieldH,
              right: 0.17333333 * width,
              left: 0.65333333 * width,
              position: "ATA",
            ),
            Player(
              image: storeTeam.playerTec(listPlayer),
              name: listPlayer.isNotEmpty ? 'TÉCNICO' : null,
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