import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/controllers/football_filed_controller.dart';
import '../../../../../../../design_system/colors/colors_app.dart';
import '../../../../../../routes/routes_app.dart';
import '../../models/football_field_model.dart';

class PlayerProfileCard extends StatelessWidget {
  final FootballFieldModel player;
  final String image;

  const PlayerProfileCard({
    Key? key, 
    required this.player, 
    required this.image,
    }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    final footballController = Provider.of<FootballFieldController>(context);
    final String position = player.playerLineup!.playerEdition!.player!.position!.name!;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Perfil do Jogador',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Image.asset(image),
              ),
              title: Text('Nome: ${player.playerLineup!.playerEdition!.player!.firstName} ${player.playerLineup!.playerEdition!.player!.lastName}'),
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: Text('Valor: ${player.score}'),
            ),
            ListTile(
              leading: const Icon(Icons.pin_drop),
              title: Text('Posição: $position'),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancelar',
                    style: TextStyle(
                      fontSize: 18,
                      color: colors.red
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Modular.to.pushNamed(
                      RoutesModulesApp.routerLineUpModule,
                      arguments: {
                        'position': position,
                        'round': footballController.round,
                      },
                    );
                  },
                  child: Text(
                    'Alterar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold, 
                      color: colors.green
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
