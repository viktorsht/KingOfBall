import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/register/controllers/register_user_controller.dart';
import 'package:rei_da_bola/app/modules/register/stories/register_store.dart';
import 'package:rei_da_bola/app/modules/shared/api/state_response.dart';
import 'package:rei_da_bola/app/modules/shared/components/password_look.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/icons/icons_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';

import '../../../../../design_system/widgets/widget_form_field.dart';
import '../../../../../design_system/widgets/widget_text_app.dart';
import '../../../../design_system/widgets/widget_loading.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = ColorsAppDefault();
    final store = Provider.of<RegisterStore>(context);
    final registerController = Provider.of<RegisterController>(context);

    final formKey = GlobalKey<FormState>();
    
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: colors.green,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImagesApp.user),
                const SizedBox(height: 10,),
                const WidgetTextApp(widgetText: 'Registrar',),
                const SizedBox(height: 30,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Nome',
                    onChanged: store.setFirstNameUser,
                    prefix: Image.asset(IconsApp.user),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: 16,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Sobrenome',
                    onChanged: store.setLastNameUser,
                    prefix: Image.asset(IconsApp.user),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: 16,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Nome de Usuário',
                    onChanged: store.setNick,
                    prefix: Image.asset(IconsApp.team),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: 16,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Email',
                    onChanged: store.setEmail,
                    prefix: Image.asset(IconsApp.arroba),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: 16,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Senha',
                    onChanged: store.setPassword,
                    prefix: Image.asset(IconsApp.password),
                    obscure: !store.passwordLook,
                    enable: true,
                    suffix: PasswordLook(
                      onPressed: store.togglePasswordLook,
                      iconData: store.passwordLook ? 
                      Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye_rounded 
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Observer(
                  builder:(_) {
                    return registerController.stateController == StateResponse.loading
                    ? const WidgetLoading(width: 5, thickness: 0.9)
                    : TextButton(
                        onPressed: () async {
                          if(store.isFormValid){
                            await registerController.registerUser(
                              store.firstNameUser, 
                              store.lastNameUser, 
                              store.nick, 
                              store.email, 
                              store.password);
                            if(registerController.stateController == StateResponse.sucess){
                              final snackBar = SnackBar(
                                content: Text('Cadastro concluído com sucesso!', style: TextStyle(color: colors.black),),
                                duration: const Duration(seconds: 3),
                                backgroundColor: colors.white,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              //store.clearValues(); // talve possa me gerar aluns bugs se eu apagar ou não os campos e querer usar depois
                              //Modular.to.navigate(RoutesModulesApp.routerStartNavigationBarModule);
                            }
                          }
                          else{
                            final snackBar = SnackBar(
                              content: const Text('Opss! Dados inválidos, tente novamente!'),
                              duration: const Duration(seconds: 3),
                              backgroundColor: colors.red,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const WidgetTextApp(widgetText: "Registrar",),
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