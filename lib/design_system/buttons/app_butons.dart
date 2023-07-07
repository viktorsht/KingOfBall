import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

abstract class ButtonApp{
  ButtonStyle get themeButtonAppPrimary;
}

class ButtonAppDefault implements ButtonApp{

  final colors = ColorsAppDefault();
  
  @override
  ButtonStyle get themeButtonAppPrimary => ElevatedButton.styleFrom(
      backgroundColor: colors.white,
      elevation: 0,
      minimumSize: const Size(250, 60),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
}