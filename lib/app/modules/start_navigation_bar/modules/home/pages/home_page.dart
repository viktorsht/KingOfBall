import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/models/team_game_model.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/pages/components/card_profile/card_profile.dart';
import 'package:rei_da_bola/app/modules/shared/models/soccer_match_model.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import '../../../../../../shared/format_date_time.dart';
import '../../../../shared/score/models/score_model.dart';
import '../../../../shared/score/stories/score_store.dart';
import 'components/buttons/climb_now.dart';
import 'components/buttons/next_round.dart';
import 'components/card_info/score_card.dart';

class HomePage extends StatelessWidget {

  final TeamGameModel teamGameModel;
  final SoccerMatchModel soccerMatchModel;
  final PageController pageController;
  final ScoreModel scoreModel;
  
  const HomePage({
    super.key, 
    required this.teamGameModel, 
    required this.pageController, 
    required this.soccerMatchModel, 
    required this.scoreModel
  });  
  
  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    final scoreStore = Provider.of<ScoreStore>(context);
    if(scoreModel.patrimony != null && scoreModel.patrimony!.isNotEmpty){
      scoreStore.setScore(scoreModel.patrimony?[0].score);
    }
    double width = MediaQuery.of(context).size.width * 0.9;
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
              Pontuations(
                colors: colors,
                height: 100,
                width: width,
                scoreValue: scoreModel.patrimony != null && scoreModel.patrimony!.isNotEmpty
                ? scoreModel.patrimony![0].score
                : "0.00"
              ),              
            ],
          ),
          const SizedBox(height: 40,),
          ClimbNowButton(
            onPressed: (){
              pageController.jumpToPage(2); // ele leva para o TeamPage() do navigationbar
            },
            heightClimbNowButton: 60,
            widthClimbNowButton: width,
            text: "ESCALAR AGORA",
            colors: colors,
          ),
          const SizedBox(height: 30,),
          Observer(
            builder: (context) {
              return NextRoundButton(
                colors: colors, 
                heightNextRoundButton: 80,
                widthNextRoundButton: width,
                onPressed: (){},
                numberRound: soccerMatchModel.championshipRound?.name != null ? soccerMatchModel.championshipRound!.name! : '',
                timeRound: soccerMatchModel.dateTime != null ? calculateRemainingTimeString(soccerMatchModel.dateTime!) : '',//calculateRemainingTimeString(soccerMatchModel.dateTime!),
              );
            }
          )
        ],
      )
    );
  }
}