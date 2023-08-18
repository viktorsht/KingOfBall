import 'package:flutter/material.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/pages/components/values_information/components/card_time.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/widgets/widget_loading.dart';

class CardValuesInformation extends StatelessWidget {

  final String? priceTeam;
  final String? restValue;

  const CardValuesInformation({
    super.key, 
    required this.priceTeam, 
    required this.restValue
  });

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            priceTeam == null 
            ? WidgetLoading(width: 5, thickness: 0.5, color: colors.green,)
            : Text(
              'Pontuação do time $priceTeam',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            )
            /*
            : CardTime(
                price: priceTeam!,
                text: 'Pontuação do time',
            ),
            priceTeam == null 
            ? WidgetLoading(width: 5, thickness: 0.5, color: colors.green,)
            : CardTime(
                price: restValue!,
                text: 'Ainda restam',
            ),*/
          ],
        ),
      );
  }
}