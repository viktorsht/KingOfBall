import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/team_virtual/register/stories/team_virtual_register_store.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

import '../../../../../design_system/icons/icons_app.dart';
import '../../../../../design_system/images/images_app.dart';
import '../../../../../design_system/widgets/widget_form_field.dart';
import '../../../../../design_system/widgets/widget_text_app.dart';

class TeamVirtualRegisterPage extends StatelessWidget {
  const TeamVirtualRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    final store = Provider.of<TeamVirtualRegisterStore>(context);
    return Scaffold(
      backgroundColor: colors.green,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Text(
              "Cadastre seu time virtual!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: colors.white,
              ),
            ),
            const SizedBox(height: 16,),
            Text(
              "Falta apenas esta etapa para concluir o cadastro",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: colors.white,
              ),
            ),
            const SizedBox(height: 50,),
            WidgetFormField(
              hint: 'Nome do time' ,
              textInputType: TextInputType.emailAddress,
              prefix: Image.asset(IconsApp.team),
              obscure: false,
              enable: true,
              onChanged: store.setNameTeam,
            ),
            const SizedBox(height: 16,),
            WidgetFormField(
              hint: 'Abreviação do time' ,
              textInputType: TextInputType.emailAddress,
              prefix: Image.asset(IconsApp.team),
              obscure: false,
              enable: true,
              onChanged: store.setAbbreviationTeam,
            ),
            const SizedBox(height: 16,),
            TextButton(
              onPressed: (){}, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const WidgetTextApp(widgetText: "Confirmar",),
                  const SizedBox(width: 10,),
                  Image.asset(ImagesApp.entrarWhite),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}