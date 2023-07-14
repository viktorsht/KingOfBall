import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controller/more_controller.dart';

class MorePage extends StatelessWidget {
  final MoreController moreController;
  const MorePage({super.key, required this.moreController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => ListView.builder(
          //itemBuilder: moreController.listSoccerMatch.length,
          itemCount: moreController.listSoccerMatch.length,
          itemBuilder: (context, index){
            Text(moreController.listSoccerMatch[index].team1Edition!.team!.name!);
          },
        ),
      )
    );
  }
}