 import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/lineup/controllers/lineup_controller.dart';
import 'package:rei_da_bola/app/modules/shared/config/config_controller.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/controllers/football_filed_controller.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';
import '../../../../../../design_system/buttons/app_butons.dart';
import '../../../../../../design_system/colors/colors_app.dart';
import '../../../../../../design_system/widgets/widget_loading.dart';
import '../../../../../../shared/format_date_time.dart';
import '../../../../shared/score/stories/score_store.dart';
import '../stories/football_field_store.dart';
import 'components/date_time_card.dart';
import 'components/football_field/football_field.dart';
import 'components/values_information/card_values_information.dart';

class FootballFieldPage extends StatelessWidget {

  const FootballFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    final buttons = ButtonAppDefault();

    final width = MediaQuery.of(context).size.width * .8;
    final height = MediaQuery.of(context).size.height * .65;
    final fieldH = 0.6773399 * height;
    final footballController = Provider.of<FootballFieldController>(context);
    final footballStore = Provider.of<FootballFieldStore>(context);
    final configController = Provider.of<ConfigController>(context);
    final lineupController = Provider.of<LineUpController>(context);
    final scoreStore = Provider.of<ScoreStore>(context);
    scoreStore.clearScore();

    List<int> list = [];
    int round = configController.getRound();
    int team = configController.getTeam();
    int edition = configController.getEdition();
    return Scaffold(
      body: Column(
        children: [
          Observer(
            builder: (context) {
              return CardValuesInformation(
                priceTeam: scoreStore.getScoreAsString(),
                restValue: scoreStore.getRestAsString(),
              );
            }
          ),
          DateTimeCard(
            colors: colors,
            dateTime: calculateRemainingTimeString(configController.getDateTime()),
          ),
          Observer(
            builder: (context) {
              return FutureBuilder(
                future: footballController.initTeamScale(round, team, edition),
                builder: (context, snapshot) {
                  configController.listFootballField(footballController.playerList);
                  configController.clearIdChange();
                  configController.setChangeFalse();
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: height * 0.7,
                      width: width,
                      child: const Center(
                        child: WidgetLoading(width: 5,thickness: 0.9,color: Colors.green,),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'),);
                  } else if (snapshot.hasData) {
                    //list = footballStore.retornaListaPlayer(configController.listMap);
                    return SizedBox(
                      height: height * 0.7,
                      width: width,
                      child: FootballField(
                        listPlayer: configController.listMap,
                        width: width,
                        height: height,
                        fieldH: fieldH,
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: height * 0.7,
                      width: width,
                      child: FootballField(
                        listPlayer: configController.listMap,
                        width: width,
                        height: height,
                        fieldH: fieldH,
                        ),
                    );
                  }
                },
              );
            }
          ),
          Observer(
            builder: (context) =>
            lineupController.stateController == StateResponse.loading
            ? Center(child: WidgetLoading(color: colors.green, width: 6, thickness: 1))
            : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
            ElevatedButton(
              style: buttons.themeButtonAppCancelar,
              onPressed: (){
                configController.clearListMap();
              }, 
              child: const Text(
                'CANCELAR',
                style: TextStyle(
                  fontSize: 20
                ),
              )
            ),
            ElevatedButton(
              style: buttons.themeButtonAppOk,
              onPressed: () async {
                int status = lineupController.getStatus();
                list = footballStore.retornaListaPlayer(configController.listMap);
                //footballStore.setIdPlayerList(list);
                if(list.length >= 11){
                  await lineupController.addListPlayerApi(list, round, team, status);                        
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Sua escalação ainda está incompleta'),
                        backgroundColor: colors.red,
                      ),
                    );
                }
              }, 
              child: const 
                Text(
                  'CONFIRMAR',
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              ),
            ],
          )
          )    
        ],
      )
    );
  }
}
