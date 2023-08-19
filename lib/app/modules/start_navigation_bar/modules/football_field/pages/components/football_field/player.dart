import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/shared/config/config_controller.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import '../../../../../../../routes/routes_app.dart';
import '../../../../../../shared/config/models/config_model.dart';
import '../../../../../../shared/score/stories/score_store.dart';
import '../profile_player.dart';

class Player extends StatelessWidget {
  
  final String image;
  final ConfigLineUpPlayer? player;
  final String position;
  final double top;
  final double right;
  final double left;

  const Player({super.key, 
    required this.image,
    this.player,
    required this.top,
    required this.right,
    required this.left,
    required this.position,
  }) : assert(top > 0.0);

  @override
  Widget build(BuildContext context) {
    final double heightFinal = MediaQuery.of(context).size.height;
    double height = 0.18181818 * (0.6773399 * heightFinal);
    final colors = ColorsAppDefault();
    final scoreStore = Provider.of<ScoreStore>(context);
    final configController = Provider.of<ConfigController>(context);
    int round = configController.getRound();
    int edition = configController.getEdition();
    return Positioned(
      top: top,
      right: right,
      left: left,
      child: Column( // Trocamos o ListView por Column
        children: [
          Observer(
            builder: (context) {
              if(player?.score != null){
                scoreStore.incrementScore(player!.score!);
              }
              return IconButton(
                onPressed: () {
                  player?.firstName != null 
                  ? showDialog(
                    context: context,
                    builder: (context) {
                      return PlayerProfileCard(player: player!,image: image);
                    },
                  )
                  : Modular.to.pushNamed(
                      RoutesModulesApp.routerLineUpModule,
                      arguments: {
                        'position': position, 
                        'round': round,
                        'edition' : edition,
                      }
                    );
                },
                icon: Image.asset(
                  image,
                  height: position == 'Goleiro' ? height - 60.0 : height - 60,
                ),
              );
            }
          ),
          player?.firstName == null 
          ? Container()
          : Observer(
            builder: (context) {
              return Container(
                decoration: BoxDecoration(
                  color: colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 20.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Text(
                    player!.firstName!,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
