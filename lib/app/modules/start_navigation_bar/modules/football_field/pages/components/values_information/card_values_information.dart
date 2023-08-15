import 'package:flutter/material.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/pages/components/values_information/components/card_time.dart';

class CardValuesInformation extends StatelessWidget {

  final String priceTeam;
  final String restValue;

  const CardValuesInformation({
    super.key, 
    required this.priceTeam, 
    required this.restValue
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CardTime(
              price: priceTeam,
              text: 'Preço do Time',
            ),
            CardTime(
              price: restValue,
              text: 'Ainda restam',
            ),
          ],
        ),
      );
  }
}