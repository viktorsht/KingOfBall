import 'package:flutter/material.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/pages/components/football_field/football_field.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/pages/components/values_information/card_values_information.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

import '../../../../../../design_system/buttons/app_butons.dart';
import '../../../../../../design_system/icons/icons_app.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    final buttons = ButtonAppDefault();
    final width = MediaQuery.of(context).size.width * .8;
    final heigth = MediaQuery.of(context).size.height * .65;
    final fieldH = 0.6773399 * heigth;
    //final fieldH = 0.6773399 * heigth - 10;

    return Scaffold(
      body: Column(
        children: [
          const CardValuesInformation(
            priceTeam: '131,00',
            parcialValue: '131,00',
            restValue: '131,00',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Image.asset(IconsApp.clock),
              ),
              //const SizedBox(width: 10,),
              Text(
                "2d 13h 27m restantes",
                style: TextStyle(
                  color: colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              
            ],
          ),
          SizedBox(
            height: heigth * 0.7,
            width: width,
            child: MyHomePage(
              width: width,
              height: heigth,
              fieldH: fieldH,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
            ],
          ),
        ],
      )
    );
  }
}