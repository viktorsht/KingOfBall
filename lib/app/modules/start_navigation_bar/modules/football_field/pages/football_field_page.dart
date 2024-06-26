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
import '../stories/football_field_store.dart';
import '../../../../../../design_system/widgets/date_time_card.dart';
import 'components/football_field/football_field.dart';

class FootballFieldPage extends StatefulWidget {
  final int round;
  final int team;
  final int edition;

  const FootballFieldPage({super.key, required this.round, required this.team, required this.edition});

  @override
  State<FootballFieldPage> createState() => _FootballFieldPageState();
}

class _FootballFieldPageState extends State<FootballFieldPage> {

  void showSnackBar(String message, Color color, Color colorText){
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: colorText),),
      duration: const Duration(seconds: 3),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  final footballController = FootballFieldController();

  @override
  void initState() {
    footballController.fechTeamScale(widget.round,widget.team,widget.edition);
    super.initState();
    footballController.fechTeamScale(widget.round,widget.team,widget.edition);
  }

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    final buttons = ButtonAppDefault();

    final width = MediaQuery.of(context).size.width * .8;
    final height = MediaQuery.of(context).size.height * .75;
    final fieldH = 0.6773399 * height;

    final footballStore = Provider.of<FootballFieldStore>(context);
    final configController = Provider.of<ConfigController>(context);
    final lineupController = Provider.of<LineUpController>(context);

    //configController.listFootballField(footballController.playerList);

    
    configController.clearIdChange();
    configController.setChangeFalse();
    //configController.clearListMap();


    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80,),
          DateTimeCard(
            colors: colors,
            dateTime: calculateRemainingTimeString(configController.getDateTime()),
          ),
          Observer(
            builder: (context) {
              configController.setRound(widget.round);
              configController.setEdition(widget.edition);
              configController.setTeam(widget.team);
              return SizedBox(
                width: width,
                height: height * 0.7,
                child:
                  footballController.stateController == StateResponse.loading
                  ? Center(
                    child: WidgetLoading(width: 6,thickness: 1,color:colors.green,),
                  )
                  : footballController.stateController == StateResponse.sucess
                  ? Observer(
                    builder: (context) {
                      if(footballController.playerList.isNotEmpty && configController.listMap.isEmpty){
                        configController.listFootballField(footballController.playerList);
                      }
                      return FootballField(
                        listPlayer: configController.listMap.toList(), // não mecha! dúvida? -> https://mobx.netlify.app/api/observable/
                        width: width,
                        height: height,
                        fieldH: fieldH,
                    );
                  },
                )
                : Container()
              );
            }
          ),
          Observer(
            builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: buttons.themeButtonAppCancelar,
                  onPressed:(){
                    configController.clearListMap();
                  },
                  child: const Text('CANCELAR', style: TextStyle(fontSize: 20),),
                ),
                ElevatedButton(
                  style: buttons.themeButtonAppOk,
                  onPressed: () async {

                    await footballController.fechTeamScale(widget.round,widget.team,widget.edition);
                    lineupController.initState(); 
                    
                    int status = lineupController.getStatus();
                    List<int> idList = footballStore.retornaListaPlayer(configController.listMap.toList());
                    bool listEqual = configController.equalList(footballController.playerList);

                    if(footballController.playerList.isEmpty && idList.length >= 11){
                      // cadastroar o time a primeira vez
                      await lineupController.addListPlayerApi(footballStore.idPlayerList,widget.round, widget.team, status);
                    }
                    else{
                      // atualizar o time
                      if(idList.length >= 11 && listEqual == false && footballController.playerList.isNotEmpty){
                        // requisição para atualizar a lista na api
                        await lineupController.updateListPlayerApi(footballStore.idPlayerList,widget.round, widget.team, status);
                      }
                      else if(idList.length >= 11 && listEqual == true){
                        showSnackBar('Sua escalação não foi modificada', colors.red, colors.white);
                      }
                      else{
                        showSnackBar('Sua escalação ainda está incompleta', colors.red, colors.white);
                      }
                    }

                    if(lineupController.stateController == StateResponse.sucess){
                      showSnackBar('Sua escalação foi enviada', colors.green, colors.white);
                    }
                    if(lineupController.stateController == StateResponse.error){
                      showSnackBar('Erro no envio do seu time! Tente novamente', colors.green, colors.white);
                    }
                  }, 
                  child: lineupController.stateController == StateResponse.loading
                    ? const Center(child: WidgetLoading(width: 3, thickness: 0.8))
                    : const Text('CONFIRMAR', style: TextStyle(fontSize: 20)),
                ),
              ],
            )
          )    
        ],
      )
    );
  }
}
