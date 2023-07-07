import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:rei_da_bola/app/modules/login/stores/login_store.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/icons/icons_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';
import 'package:rei_da_bola/design_system/widgets/widget_loading.dart';

import '../../../../../design_system/widgets/widget_form_field.dart';
import '../../../../../design_system/widgets/widget_text_app.dart';
import '../../../../design_system/widgets/widget_snackbar.dart';
import '../../../routes/routes_app.dart';
import '../../shared/components/password_look.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<LoginStore>(context);
    final loginController = Provider.of<LoginController>(context);
    final colors = ColorsAppDefault();
    //final loginController = LoginController();
    return Form(
      child: Scaffold(
        backgroundColor: colors.green,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImagesApp.user),
                const SizedBox(height: 10,),
                const WidgetTextApp(widgetText: 'Login',),
                const SizedBox(height: 30,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Email' ,
                    textInputType: TextInputType.emailAddress,
                    prefix: Image.asset(IconsApp.arroba),
                    obscure: false,
                    enable: true,
                    onChanged: store.setEmail,
                  ),
                ),
                const SizedBox(height: 16,),
                Observer(
                  builder: (_) => WidgetFormField(
                    hint: 'Senha',
                    prefix: Image.asset(IconsApp.password),
                    onChanged: store.setPassword,
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
                  builder: (_) {
                    return loginController.stateController == 'loading' 
                    ? const WidgetLoading(width: 5, thickness: 0.9) 
                    : TextButton(
                      onPressed: () async {
                        if(store.isFormValid){
                          await loginController.login(store.email, store.password);
                          if(loginController.stateController == 'sucess'){
                            Modular.to.navigate(RoutesModulesApp.routerHomeModule);
                          }
                          else{
                            WidgetSnackBar.show(
                              context: context,
                              message: 'Email ou senha incorretos',
                              duration: const Duration(seconds: 3),
                              backgroundColor: Colors.red,
                            );
                          }
                        }
                        else{
                          final snackBar = SnackBar(
                            content: const Text('Email ou senha inválidos'),
                            duration: const Duration(seconds: 3),
                            backgroundColor: colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }, 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const WidgetTextApp(widgetText: "Entrar",),
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