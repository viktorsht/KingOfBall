import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/controllers/football_filed_controller.dart';
import '../../../../../../design_system/buttons/app_butons.dart';
import '../../../../../../design_system/widgets/widget_loading.dart';
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
    //final colors = ColorsAppDefault();
    final buttons = ButtonAppDefault();

    final width = MediaQuery.of(context).size.width * .8;
    final height = MediaQuery.of(context).size.height * .65;
    final fieldH = 0.6773399 * height;
    final footballController = Provider.of<FootballFieldController>(context);
    //final fieldH = 0.6773399 * height - 10;


    return Scaffold(
      body: Column(
        children: [
          const CardValuesInformation(
            priceTeam: '131,00',
            restValue: '131,00',
          ),
          Observer(
            builder: (context) => FutureBuilder(
                future: footballController.isChange == false // aqui pode passar a função direto sem flag 
                  ? footballController.initTeamScale(round, team, edition)
                  : null,
                builder: (context, snapshot) {
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
                    return SizedBox(
                        height: height * 0.7,
                        width: width,
                        child: Observer(
                          builder: (context) =>FootballField(
                            listPlayer: footballController.playerList,
                            listCoach: footballController.coachList,
                            width: width,
                            height: height,
                            fieldH: fieldH,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                        height: height * 0.7,
                        width: width,
                        child: Observer(
                          builder: (context) =>FootballField(
                            listPlayer:  footballController.playerList,
                            listCoach: footballController.coachList,
                            width: width,
                            height: height,
                            fieldH: fieldH,
                        ),
                      ),
                    );
                  }
                },
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: buttons.themeButtonAppCancelar,
                onPressed: (){}, 
                child: const Text(
                  'CANCELAR',
                  style: TextStyle(
                    fontSize: 20
                  ),
                )
              ),
              ElevatedButton(
                style: buttons.themeButtonAppOk,
                onPressed: (){}, 
                child: const Text(
                  'CONFIRMAR',
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}