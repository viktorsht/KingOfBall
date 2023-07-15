import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/pages/components/card_profile/card_profile.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import '../controller/card_profile_controller.dart';
import 'components/buttons/climb_now.dart';
import 'components/card_info/featured_player.dart';
import 'components/buttons/next_round.dart';
import 'components/card_info/patrimony.dart';
import 'components/card_info/punctuations.dart';

class HomePage extends StatelessWidget {

  final TeamGameModel teamGameModel;
  
  const HomePage({
    super.key, 
    required this.teamGameModel
  });  
  
  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40,),
          Observer(
            builder:(_) => CardProfile(
              teamGameModel: teamGameModel,
            )
          ),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Punctuations(
                colors: colors,
                height: 100,
                width: 120,
                punctuation: "75,15",
              ),
              Patrimony(
                colors: colors,
                height: 100,
                width: 120,
                patrimonyValue: "141,15",
              ),
              FeaturedPlayer(
                colors: colors,
                height: 100,
                width: 120,
                namePlayer: 'Ciclano',
                playerPoints: '23,7', 
              ),
            ],
          ),
          const SizedBox(height: 40,),
          ClimbNowButton(
            onPressed: (){},
            heightClimbNowButton: 60,
            widthClimbNowButton: 350,
            text: "ESCALAR AGORA",
            colors: colors,
          ),
          const SizedBox(height: 30,),
          NextRoundButton(
            colors: colors, 
            heightNextRoundButton: 80,
            widthNextRoundButton: 350,
            onPressed: (){},
            numberRound: '3',
            timeRound: '2d 13h 27m',
          )
        ],
      )
    );
  }
}