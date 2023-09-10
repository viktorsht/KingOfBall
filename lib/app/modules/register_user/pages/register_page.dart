import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/register_user/controllers/register_user_controller.dart';
import 'package:rei_da_bola/app/modules/register_user/models/register_user_model.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';
import 'package:rei_da_bola/app/modules/shared/components/password_look.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/icons/icons_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';

import '../../../../../design_system/widgets/widget_form_field.dart';
import '../../../../../design_system/widgets/widget_text_app.dart';
import '../../../../design_system/widgets/widget_loading.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool isViewPassword = false;
  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;
  final colors = ColorsAppDefault();

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
    final controller = Provider.of<RegisterController>(context);

    final registerUserModel = RegisterUserModel.empty();

    void setIsViewPassword(){
      setState(() {
        isViewPassword = !isViewPassword;
      });
    }

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: WidgetFormField(
                    hint: 'Nome',
                    prefix: Image.asset(IconsApp.user),
                    value: registerUserModel.firstName.toString(),
                    validator: (v) => registerUserModel.firstName.validator(),
                    onChanged: registerUserModel.setFirstName,
                  ),
                ),
                const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: WidgetFormField(
                      hint: 'Sobrenome',
                      prefix: Image.asset(IconsApp.user),
                      value: registerUserModel.lastName.toString(),
                      validator:(v) => registerUserModel.lastName.validator(),
                      onChanged: registerUserModel.setLastName,
                    ),
                ),
                const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: WidgetFormField(
                    hint: 'Nome de usuário',
                    prefix: Image.asset(IconsApp.arroba),
                    value: registerUserModel.nick.toString(),
                    validator: (v) => registerUserModel.lastName.validator(),
                    onChanged: registerUserModel.setNick,
                  ),
                ),
                const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: WidgetFormField(
                    hint: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefix: Image.asset(IconsApp.email),
                    value: registerUserModel.email.toString(),
                    validator: (v) => registerUserModel.email.validator(),
                    onChanged: registerUserModel.setEmail,
                  ),
                ),
                const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: WidgetFormField(
                    hint: 'Senha',
                    keyboardType: TextInputType.emailAddress,
                    prefix: Image.asset(IconsApp.password),
                    obscure: !isViewPassword,
                    value: registerUserModel.password.toString(),
                    validator: (v) => registerUserModel.password.validator(),
                    onChanged: registerUserModel.setPassword,
                    suffix: PasswordLook(
                      onPressed: setIsViewPassword,
                      iconData: isViewPassword ? Icons.remove_red_eye_outlined : Icons.remove_red_eye_rounded,
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Observer(
                  builder:(_) {
                    return controller.stateController is LoadingState
                    ? const WidgetLoading(width: 6, thickness: 1)
                    : TextButton(
                      onPressed: () async {
                        final valid = form.validate();
                        if(valid){
                          await controller.registerUser(registerUserModel);
                          if(controller.stateController is SucessState){
                            showSnackBar('Cadastro concluído!', colors.white, colors.black);
                            await Future.delayed(const Duration(seconds: 3));
                            Modular.to.navigate(RoutesModulesApp.routerLoginModule);
                          }
                          else if(controller.stateController is ErrorState){
                            if(controller.hasEmail == true && controller.hasNick == true){
                              showSnackBar('Email e nome de usuário em uso', colors.red, colors.white);
                            }
                            else if(controller.hasNick == true){
                              showSnackBar('Nome de usuário não disponível', colors.red, colors.white);
                            }
                            else if(controller.hasEmail == true){
                              showSnackBar('Email já está em uso em outra conta', colors.red, colors.white);
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
                          const WidgetTextApp(widgetText: "Registrar",),
                          const SizedBox(width: 10,),
                          Image.asset(ImagesApp.entrarWhite),
                        ],
                      ),
                    );
                  }
                ),
                const SizedBox(height: 16,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: (){
                      Modular.to.navigate(RoutesModulesApp.routerLoginModule);
                    }, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Já tenho conta: ",
                          style: TextStyle(
                            fontSize: 16,
                            color: colors.white
                          ),
                        ),
                        Text(
                          "Fazer login",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}