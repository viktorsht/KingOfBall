import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/team_virtual/modules/register/model/register_team_virtual_model.dart';
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

class UpdateTeamPage extends StatefulWidget {
  final String team;
  final String name;
  final String abb;
  const UpdateTeamPage({super.key, required this.team, required this.name, required this.abb});

  @override
  State<UpdateTeamPage> createState() => _UpdateTeamPageState();
}

class _UpdateTeamPageState extends State<UpdateTeamPage> {

  void showSnackBar(String message, Color color, Color colorText){
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: colorText),),
      duration: const Duration(seconds: 3),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {

    final colors = ColorsAppDefault();
    final formKey = GlobalKey<FormState>();

    final store = Provider.of<UpdateTeamStore>(context);
    final updateTeamController = Provider.of<UpdateTeamController>(context);
    final TextEditingController teamNameController = TextEditingController();
    final TextEditingController teamAbbController = TextEditingController();


    String msgButton = 'Confirmar';

    teamNameController.text = widget.name;
    teamAbbController.text = widget.abb;
    store.setNameTeam(widget.name);
    store.setAbbTeam(widget.abb);

    final registerTeamVirtualModel = RegisterTeamVirtualModel.empty();

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
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: WidgetFormField(
                      hint: 'Nome do time',
                      prefix: Image.asset(IconsApp.team),
                      value: registerTeamVirtualModel.name.toString(),
                      validator: (v) => registerTeamVirtualModel.name.validator(),
                      onChanged: registerTeamVirtualModel.setName,
                    ),
                ),
                const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: WidgetFormField(
                    hint: 'Abreviação do time',
                    prefix: Image.asset(IconsApp.team),
                    value: registerTeamVirtualModel.abb.toString(),
                    validator: (v) => registerTeamVirtualModel.abb.validator(),
                    onChanged: registerTeamVirtualModel.setAbreviacaoTeam,
                  ),
                ),
                Observer(
                  builder:(_) {
                    return updateTeamController.stateController == StateResponse.loading
                    ? const WidgetLoading(width: 5, thickness: 0.9)
                    : TextButton(
                      onPressed: () async {
                        if(!store.isFormValid){
                        }
                        
                        else if(store.isFormValid){
                          if(store.abbTeam.length > 3){
                            msgButton = 'Abreviação com APENAS 3 caracteres';
                          }
                          else{
                            String sMethod = "patch";
                            if(store.nameTeam != widget.name && store.abbTeam != widget.abb){
                              final body = TeamGameUpdate(name: store.nameTeam, abb: store.abbTeam, sMethod: sMethod);
                              await updateTeamController.updateTeam(widget.team, body);
                            }
                            else if(store.nameTeam == widget.name && store.abbTeam != widget.abb){
                              final body = TeamGameUpdate(abb: store.abbTeam, sMethod: sMethod);
                              await updateTeamController.updateTeam(widget.team, body);
                            }
                            else if (store.nameTeam != widget.name && store.abbTeam == widget.abb){
                              final body = TeamGameUpdate(name: store.nameTeam, sMethod: sMethod);
                              await updateTeamController.updateTeam(widget.team, body);
                            }
                            if(updateTeamController.stateController == StateResponse.sucess){
                              showSnackBar('Cadastro concluído com sucesso!', colors.white, colors.black);
                              //Modular.to.navigate(RoutesModulesApp.routerTeamVirtualModule);
                            }
                            updateTeamController.stateController = StateResponse.start;
                          }
                        }
                        if(updateTeamController.stateController != StateResponse.sucess){
                          // quero evitar o bug de colocar o SnackBar de sucesso e depois de um erro qualquer
                          showSnackBar('Cadastro concluído com sucesso!', colors.red, colors.white);
                          
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