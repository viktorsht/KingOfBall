import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rei_da_bola/app/modules/buy/controllers/buy_controller.dart';
import 'package:rei_da_bola/app/routes/routes_app.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/widgets/widget_loading.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';

import '../../../../design_system/images/images_app.dart';
import '../models/buy_model.dart';
import 'components/card_buy_players.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {

  final controllerBuy = BuyController();
  
  @override
  void initState() {
    super.initState();
    controllerBuy.initBuy();
  }

  @override
  Widget build(BuildContext context) {
    
    final colors = ColorsAppDefault();
    //List<BuyModel> list = controllerBuy.groupItemsByAbb(controllerBuy.listBuy);

    return Scaffold(
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
          },
        ),
      ),
      body: 
          Observer(
            builder: (_) => /*FutureBuilder(
              future: controllerBuy.initBuy(), // Coloque a chamada do método initBuy() dentro do FutureBuilder
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Exibir o indicador circular enquanto estiver carregando
                  return Center(
                    child: WidgetLoading(
                      color: colors.green,
                      width: 6,
                      thickness: 1,
                    ),
                  );
                } 
                else {
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index){
                      /*return ListTile(
                        title: Text(list[index].player!.firstname!),
                        subtitle: Text(list[index].player!.position!.name!),
                      );*/
                      int numImage = controllerBuy.generateNumber();
                      return CardBuyPlayers(
                        color: colors,
                        image: controllerBuy.image[numImage],
                        namePlayer: list[index].player!.firstname!,
                        nameTeam: list[index].teamEdition!.team!.name!,
                        positionAbb: list[index].player!.position!.abb!,
                      );
                    }
                  );
                }
              }
            ),*/
            controllerBuy.stateController != StateResponse.sucess ? Center(
                    child: WidgetLoading(
                      color: colors.green,
                      width: 6,
                      thickness: 1,
                    ),
                  ) 
                  : ListView.builder(
                    itemCount: controllerBuy.listBuy.length,
                    itemBuilder: (context, index){
                      int numImage = controllerBuy.generateNumber();
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                        child: CardBuyPlayers(
                          color: colors,
                          numb: index,
                          image: controllerBuy.image[numImage],
                          namePlayer: '${controllerBuy.listBuy[index].player!.firstname!} ${controllerBuy.listBuy[index].player!.lastname!}',
                          nameTeam: controllerBuy.listBuy[index].teamEdition!.team!.name!,
                          positionAbb: controllerBuy.listBuy[index].player!.position!.abb!,
                        ),
                      );
                    }
                  ),
          ),
    );
  }
}