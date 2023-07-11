import 'package:flutter/material.dart';

import '../../../../../../../../design_system/icons/icons_app.dart';
import 'components/profile_home.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const ProfileHome(),
        GestureDetector(
          onTap: () {},
          child: Image.asset(IconsApp.editar)
        ),
      ],
    );
  }
}