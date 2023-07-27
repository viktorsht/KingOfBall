import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/models/player_model.dart';
import '../../../../../../design_system/images/images_app.dart';

part 'team_stories.g.dart';

class TeamStoriesController = TeamStoriesControllerImpl with _$TeamStoriesController;

abstract class TeamStoriesControllerImpl with Store{

  @action
  String playerGol(List<PlayerModel> list){
    return list.isNotEmpty ? ImagesApp.goleiro : ImagesApp.addPlayer;
  }

  @action
  String playerTec(List<PlayerModel> list){
    return list.isNotEmpty ? ImagesApp.tecnico : ImagesApp.addPlayer;
  }

  @action
  String player1(List<PlayerModel> list){
    return list.isNotEmpty ? ImagesApp.jogador1 : ImagesApp.addPlayer;
  }

  @action
  String player2(List<PlayerModel> list){
    return list.isNotEmpty ? ImagesApp.jogador2 : ImagesApp.addPlayer;
  }

  @action
  String player3(List<PlayerModel> list){
    return list.isNotEmpty ? ImagesApp.jogador3 : ImagesApp.addPlayer;
  }

  @action
  String? playerName(List<PlayerModel> list, int index){
    return list.isNotEmpty ? list[index].firstname : null;
  }
}