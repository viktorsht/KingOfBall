import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';

import '../../../../../../../../design_system/widgets/widget_loading.dart';

class Pontuations extends StatelessWidget {
  final ColorsAppDefault colors;
  final double height;
  final double width;
  final String? scoreValue;


  const Pontuations({
    super.key, 
    required this.colors,
     required this.height, 
     required this.width, 
     required this.scoreValue,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colors.orange
      ),
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "PONTUAÇÃO",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colors.white
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  scoreValue == null ? WidgetLoading(width: 5, thickness: 0.5, color: colors.black,)
                  : Text(
                    scoreValue!,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: colors.white
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Text(
                    'pts', 
                    style: TextStyle(
                      color: colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ],
          ),
          Image.asset(ImagesApp.rank)
        ],
      ),
    );
  }
}