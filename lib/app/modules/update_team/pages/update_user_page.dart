import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import '../../../../design_system/colors/colors_app.dart';
import '../../../../design_system/icons/icons_app.dart';
import '../../../../design_system/images/images_app.dart';
import '../../../../design_system/widgets/widget_form_field.dart';
import '../../../../design_system/widgets/widget_loading.dart';
import '../../../../design_system/widgets/widget_text_app.dart';
import '../../../../shared/api/state_response.dart';
import '../../../routes/routes_app.dart';
import '../controllers/update_team_controller.dart';
import '../models/team_game_update.dart';
import '../stories/update_team_store.dart';

class UpdateTeamPage extends StatelessWidget {
  final String team;
  final String name;
  final String abb;
  const UpdateTeamPage({super.key, required this.team, required this.name, required this.abb});

  @override
  Widget build(BuildContext context) {

    final colors = ColorsAppDefault();
    const double height = 12;
    final formKey = GlobalKey<FormState>();

    final store = Provider.of<UpdateTeamStore>(context);
    final updateTeamController = Provider.of<UpdateTeamController>(context);
    final TextEditingController teamNameController = TextEditingController();
    final TextEditingController teamAbbController = TextEditingController();


    String msgUser = 'Ocorreu um erro inesperado, tente mais tarde';
    String msgButton = 'Confirmar';

    teamNameController.text = name;
    teamAbbController.text = abb;
    store.setNameTeam(name);
    store.setAbbTeam(abb);

    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: colors.green,
        appBar: AppBar(
        backgroundColor: colors.green,
        centerTitle: true,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Image.asset(
            ImagesApp.brasaoTeam,
            height: 50,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Modular.to.navigate(RoutesModulesApp.routerStartNavigationBarModule);
            //Navigator.pop(context);
          },
        ),
      ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const WidgetTextApp(widgetText: 'Meus Dados',),
                const SizedBox(height: 30,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Nome do time',
                    controller: teamNameController,
                    onChanged: store.setNameTeam,
                    prefix: Image.asset(IconsApp.team),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: height,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Abreviação do time',
                    controller: teamAbbController,
                    onChanged: store.setAbbTeam,
                    prefix: Image.asset(IconsApp.team),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: height,),
                Observer(
                  builder:(_) {
                    return updateTeamController.stateController == StateResponse.loading
                    ? const WidgetLoading(width: 5, thickness: 0.9)
                    : TextButton(
                      onPressed: () async {
                        if(!store.isFormValid){
                          msgUser = 'Campos não preenchidos';
                        }
                        
                        else if(store.isFormValid){
                          if(store.abbTeam.length > 3){
                            msgButton = 'Abreviação com APENAS 3 caracteres';
                          }
                          else{
                            String sMethod = "patch";
                            if(store.nameTeam != name && store.abbTeam != abb){
                              final body = TeamGameUpdate(name: store.nameTeam, abb: store.abbTeam, sMethod: sMethod);
                              await updateTeamController.updateTeam(team, body);
                            }
                            else if(store.nameTeam == name && store.abbTeam != abb){
                              final body = TeamGameUpdate(abb: store.abbTeam, sMethod: sMethod);
                              await updateTeamController.updateTeam(team, body);
                            }
                            else if (store.nameTeam != name && store.abbTeam == abb){
                              final body = TeamGameUpdate(name: store.nameTeam, sMethod: sMethod);
                              await updateTeamController.updateTeam(team, body);
                            }
                            if(updateTeamController.stateController == StateResponse.sucess){
                              final snackBar = SnackBar(
                                content: Text('Cadastro concluído com sucesso!', style: TextStyle(color: colors.black),),
                                duration: const Duration(seconds: 3),
                                backgroundColor: colors.white,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              //Modular.to.navigate(RoutesModulesApp.routerTeamVirtualModule);
                            }
                            updateTeamController.stateController = StateResponse.start;
                          }
                        }
                        if(updateTeamController.stateController != StateResponse.sucess){
                          // quero evitar o bug de colocar o SnackBar de sucesso e depois de um erro qualquer 
                          final snackBar = SnackBar(
                            content: Text(
                              msgUser,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16
                              ),
                            ),      
                            duration: const Duration(seconds: 3),
                            backgroundColor: colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetTextApp(widgetText: msgButton,),
                          const SizedBox(width: 10,),
                          Image.asset(ImagesApp.entrarWhite),
                        ],
                      )
                    );
                 }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}