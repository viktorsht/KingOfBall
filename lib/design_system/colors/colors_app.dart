import 'package:flutter/material.dart';

abstract class ColorsApp {
  //Seguir exemplo do branco
  Color get white;
  Color get whiteLigth;
  Color get red;
  Color get green;
  Color get black;
  Color get gray;
  Color get grayDark;
}

class ColorsAppDefault implements ColorsApp {
  @override
  Color get white => const Color(0xFFFFFFFF);
  @override
  Color get whiteLigth => const Color(0xFFDEDEDE);
  @override
  Color get red => const Color(0xFFFF0000);
  @override
  Color get green => const Color(0xFF00BD08);
  @override
  Color get black => const Color(0xFF1A1A1A); 
  @override
  Color get gray => const Color(0xFFA0A0A0);
  @override
  Color get grayDark => const Color(0xff717F7F);
}