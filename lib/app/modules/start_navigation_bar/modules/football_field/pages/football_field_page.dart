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
import '../stories/football_field_store.dart';
import 'components/football_field/football_field.dart';
import 'components/values_information/card_values_information.dart';

class FootballFieldPage extends StatelessWidget {
  
  final int round;
  final int team;
  final int edition;
  const FootballFieldPage({
    super.key, 
    required this.round, 
    required this.team, 
    required this.edition, 
  });

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
    //final fieldH = 0.6773399 * height - 10;

    List<int> list = [];

    return Scaffold(
      body: Column(
        children: [
          const CardValuesInformation(
            priceTeam: '131,00',
            restValue: '131,00',
          ),
          Observer(
            builder: (context) => FutureBuilder(
                future: footballController.initTeamScale(round, team, edition),
                builder: (context, snapshot) {
                  //configController.listFootballField(footballController.playerList);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: height * 0.7,
                      width: width,
                      child: const Center(
                        child: WidgetLoading(
                          width: 5,
                          thickness: 0.9,
                          color: Colors.green,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                      configController.listFootballField(footballController.playerList);
                      list = footballStore.retornaListaPlayer(configController.listMap);
                      //print("${configController.listMap.length}");
                      //print('object');
                      return SizedBox(
                        height: height * 0.7,
                        width: width,
                        child: Observer(
                          builder: (context) {
                            return FootballField(
                            listPlayer: configController.listMap,
                            listCoach: footballController.coachList,
                            width: width,
                            height: height,
                            fieldH: fieldH,
                          );
                        }
                      ),
                    );
                  } else {
                      return SizedBox(
                        height: height * 0.7,
                        width: width,
                        child: Observer(
                          builder: (context) {
                            return FootballField(
                              listPlayer: configController.listMap,
                              listCoach: footballController.coachList,
                              width: width,
                              height: height,
                              fieldH: fieldH,
                          );
                        }
                      ),
                    );
                  }
                },
              ),
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
                  Observer(
                    builder: (context) => ElevatedButton(
                        style: buttons.themeButtonAppOk,
                        onPressed: () async {
                          //if(footballStore.idPlayerList.length >= 11){
                            int status = lineupController.getStatus();
                            list = footballStore.retornaListaPlayer(configController.listMap);
                            //footballStore.setIdPlayerList(list);
                            if(list.length >= 11){
                              await lineupController.addListPlayerApi(list, round, team, status);
                    //        }
                              if(lineupController.stateController == StateResponse.sucess){
                                //print(list);
                                //configController.clearListMap();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Sua escalação realizada!'),
                                    backgroundColor: colors.green,
                                  ),
                                );
                              }
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Sua escalação ainda está incompleta'),
                                    backgroundColor: colors.red,
                                  ),
                                );
                            }
                          //}
                        }, 
                        child: const Text(
                          'CONFIRMAR',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                      ),
                    //}
                  ),
                ],
              ),
          ),
        ],
      )
    );
  }
}