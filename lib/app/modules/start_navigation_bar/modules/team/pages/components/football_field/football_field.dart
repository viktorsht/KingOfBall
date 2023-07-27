import 'package:flutter/material.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/pages/components/football_field/player.dart';
import '../../../../../../../../design_system/images/images_app.dart';
import '../../../models/player_model.dart';
import '../../../stories/team_stories.dart';

class FootballField extends StatelessWidget {
  final double width;
  final double height;
  final double fieldH;
  final List<PlayerModel> listPlayer;

  const FootballField({
    super.key, 
    required this.width, 
    required this.height, 
    required this.fieldH, 
    required this.listPlayer
  });

  @override
  Widget build(BuildContext context) {
    final store = TeamStoriesController();
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
                image: store.playerGol(listPlayer),
                name: store.playerName(listPlayer, 0),
                top: 0.07272727 * fieldH,
                right: 0.0,
                left: 0.0,
                position: "GOL",
              ),
            Player(
              image: store.player1(listPlayer),
              name: store.playerName(listPlayer, 1),
              top: 0.21818182 * fieldH,
              right: 0.70666667 * width,
              left: 0.0,
              position: "LAT",
            ),
            Player(
              image: store.player3(listPlayer),
              name: store.playerName(listPlayer, 2),
              top: 0.23636364 * fieldH,
              right: 0.29333333 * width,
              left: 0.0,
              position: "ZAG",
            ),
            Player(
              image: store.player2(listPlayer),
              name: store.playerName(listPlayer, 3),
              top: 0.23636364 * fieldH,
              right: 0.0,
              left: 0.29333333 * width,
              position: "ZAG",
            ),
            Player(
              image: store.player1(listPlayer),
              name: store.playerName(listPlayer, 4),
              top: 0.21818182 * fieldH,
              right: 0.0,
              left: 0.70666667 * width,
              position: "LAT",
            ),
            Player(
              image: store.player3(listPlayer),
              name: store.playerName(listPlayer, 5),
              top: 0.47272727 * fieldH,
              right: 0.16333333 * width,
              left: 0.65333333 * width,
              position: "VOL",
            ),
            Player(
              image: store.player2(listPlayer),
              name: store.playerName(listPlayer, 6),
              top: 0.45454545 * fieldH,
              right: 0.01333333 * width,
              left: 0.0,
              position: "MEI",
            ),
            Player(
              image: store.player1(listPlayer),
              name: store.playerName(listPlayer, 7),
              top: 0.47272727 * fieldH,
              right: 0.47 * width,
              left: 0.0,
              position: "VOL",
            ),
            Player(
              image: store.player3(listPlayer),
              name: store.playerName(listPlayer, 8),
              top: 0.69090909 * fieldH,
              right: 0.29333333 * width,
              left: 0.29333333 * width,
              position: "ATA",
            ),
            Player(
              image: store.player2(listPlayer),
              name: store.playerName(listPlayer, 9),
              top: 0.69090909 * fieldH,
              right: 0.44 * width,
              left: 0.0,
              position: "ATA",
            ),
            Player(
              image: store.player1(listPlayer),
              name: store.playerName(listPlayer, 10),
              top: 0.69090909 * fieldH,
              right: 0.17333333 * width,
              left: 0.65333333 * width,
              position: "ATA",
            ),
            Player(
              image: store.playerTec(listPlayer),
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