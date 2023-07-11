import 'package:flutter/material.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/home/pages/components/card/card_profile.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

import 'components/featured_player.dart';
import 'components/patrimony.dart';
import 'components/punctuations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40,),
          const CardProfile(),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Punctuations(
                colors: colors,
                height: 100,
                width: 120,
                punctuation: "75,15",
              ),
              Patrimony(
                colors: colors,
                height: 100,
                width: 120,
                patrimonyValue: "141,15",
              ),
              FeaturedPlayer(
                colors: colors,
                height: 100,
                width: 120,
                namePlayer: 'Ciclano',
                playerPoints: '23,7', 
              ),
            ],
          )
        ],
      )
    );
  }
}