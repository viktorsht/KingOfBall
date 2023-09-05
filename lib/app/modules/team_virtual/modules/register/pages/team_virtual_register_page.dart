import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/team_virtual/modules/register/model/register_team_virtual_model.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import '../../../../../../design_system/icons/icons_app.dart';
import '../../../../../../design_system/images/images_app.dart';
import '../../../../../../design_system/widgets/widget_form_field.dart';
import '../../../../../../design_system/widgets/widget_loading.dart';
import '../../../../../../design_system/widgets/widget_text_app.dart';
import '../../../../../../shared/api/state_response.dart';
import '../controller/register_team_virtual_controller.dart';

class TeamVirtualRegisterPage extends StatefulWidget {
  final int user;
  const TeamVirtualRegisterPage({super.key, required this.user});

  @override
  State<TeamVirtualRegisterPage> createState() => _TeamVirtualRegisterPageState();
}

class _TeamVirtualRegisterPageState extends State<TeamVirtualRegisterPage> {
  
  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

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
    final registerTVController = Provider.of<RegisterTeamVirtualController>(context);

    final registerTeamVirtualModel = RegisterTeamVirtualModel.empty();
    registerTeamVirtualModel.setUserId(widget.user);

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
        backgroundColor: colors.green,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Image.asset(ImagesApp.logo),
              //const SizedBox(height: 16,),
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
              const SizedBox(height: 16,),
              Observer(
                builder:(_) {
                  return registerTVController.stateController == StateResponse.loading
                    ? const WidgetLoading(width: 6, thickness: 1)
                    : TextButton(
                      onPressed: () async {
                        final valid = form.validate();
                        if(valid){
                          final retorno = await registerTVController.registerTeamVirtual(registerTeamVirtualModel);
                          if(registerTVController.stateController == StateResponse.sucess){
                            showSnackBar('Seu time cadastrado', colors.white, colors.black);
                            await Future.delayed(const Duration(seconds: 3));
                            Modular.to.navigate(RoutesModulesApp.routerRegisterTeamEditionModule, arguments:retorno.id);
                          }
                          else if (registerTVController.stateController == StateResponse.error){
                            if(registerTVController.hasName == true && registerTVController.hasAbb == true){
                              showSnackBar('Nome e abreviação do time em uso', colors.red, colors.white);
                            }
                            else if(registerTVController.hasName == true){
                              showSnackBar('Nome do time não disponível', colors.red, colors.white);
                            }
                            else if(registerTVController.hasAbb == true){
                              showSnackBar('Abreviação já está em uso em outra conta', colors.red, colors.white);
                            }
                            else{
                              showSnackBar('Ocorreu um erro inesperado, tente mais tarde', colors.red, colors.white);
                            }
                          }
                        }
                        else{
                          showSnackBar('Campos inválidos', colors.red, colors.white);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const WidgetTextApp(widgetText: "Continuar",),
                          const SizedBox(width: 10,),
                          Image.asset(ImagesApp.entrarWhite),
                      ],
                    ),
                  );
                }
              ),
            ]
          ),
        ),
      ),
    );
  }
}