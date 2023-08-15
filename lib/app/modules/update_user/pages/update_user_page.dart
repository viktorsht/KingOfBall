import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../design_system/colors/colors_app.dart';
import '../../../../design_system/icons/icons_app.dart';
import '../../../../design_system/images/images_app.dart';
import '../../../../design_system/widgets/widget_form_field.dart';
import '../../../../design_system/widgets/widget_text_app.dart';
import '../../../routes/routes_app.dart';

class UpdateUserPage extends StatelessWidget {
  const UpdateUserPage({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = ColorsAppDefault();
    const double height = 12;
    //final store = Provider.of<RegisterStore>(context);
    //final registerController = Provider.of<RegisterController>(context);
    final formKey = GlobalKey<FormState>();

    String msgUser = 'Ocorreu um erro inesperado, tente mais tarde';
    String msgButton = 'Confirmar';

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
                //Image.asset(ImagesApp.user),
                //const SizedBox(height: 10,),
                const WidgetTextApp(widgetText: 'Meus Dados',),
                const SizedBox(height: 30,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Nome',
                    //onChanged: store.setFirstNameUser,
                    prefix: Image.asset(IconsApp.user),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: height,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Sobrenome',
                    //onChanged: store.setLastNameUser,
                    prefix: Image.asset(IconsApp.user),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: height,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Nome de usuário',
                    //onChanged: store.setNick,
                    prefix: Image.asset(IconsApp.arroba),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: height,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Email',
                    //onChanged: store.setEmail,
                    prefix: Image.asset(IconsApp.email),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: height,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Nome do time',
                    //onChanged: store.setEmail,
                    prefix: Image.asset(IconsApp.team),
                    obscure: false,
                    enable: true,
                  ),
                ),
                const SizedBox(height: height,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Abreviação do time',
                    //onChanged: store.setEmail,
                    prefix: Image.asset(IconsApp.team),
                    obscure: false,
                    enable: true,
                  ),
                ),
                /*
                const SizedBox(height: height,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Senha',
                    //onChanged: store.setPassword,
                    prefix: Image.asset(IconsApp.password),
                    //obscure: !store.passwordLook,
                    enable: true,
                    suffix: PasswordLook(
                      onPressed: store.togglePasswordLook,
                      iconData: store.passwordLook ? 
                      Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye_rounded 
                    ),
                  ),
                ),*/
                const SizedBox(height: height,),
                    
                    /*
                Observer(
                  builder:(_) {
                    return registerController.stateController == StateResponse.loading
                    ? const WidgetLoading(width: 5, thickness: 0.9)
                    : */TextButton(
                      onPressed: () async {
                        /*
                        if(!store.isValidFields){
                          msgUser = 'Campos não preenchidos';
                        }
                        else if (!store.isEmailValid){
                          msgUser = 'Email inválido ou não inserido';
                        }
                        else if (!store.isPasswordValid){
                          msgUser = 'A senha inválida! Use mais de 8 dígitos, caractere especial, uma letra maiúscula e um número';
                        }
                        else if(store.isFormValid){
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
                            await Future.delayed(const Duration(seconds: 3));
                            //store.clearValues(); // talve possa me gerar aluns bugs se eu apagar ou não os campos e querer usar depois
                            //registerController.cleanFiels();
                            Modular.to.navigate(RoutesModulesApp.routerLoginModule);
                            //Modular.to.navigate(RoutesModulesApp.routerTeamVirtualModule);
                          }
                          else if(registerController.stateController == StateResponse.error){
                            if(registerController.hasEmail && registerController.hasNick){
                              msgUser = "Email e nome de usuário em uso";
                            }
                            else if(registerController.hasNick == true){
                              msgUser = 'Nome de usuário não disponível';
                            }
                            else if(registerController.hasEmail == true){
                              msgUser = 'Email já está em uso em outra conta';
                            }
                          }
                        }
                        if(registerController.stateController != StateResponse.sucess){
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
                        */
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetTextApp(widgetText: msgButton,),
                          const SizedBox(width: 10,),
                          Image.asset(ImagesApp.entrarWhite),
                        ],
                      )
                    ),
                 // }
                //),
              ],
            ),
          ),
        ),
      ),
    );
  }
}