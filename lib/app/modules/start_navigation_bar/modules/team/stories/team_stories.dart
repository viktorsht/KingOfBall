import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/models/player_model.dart';
import '../../../../../../design_system/images/images_app.dart';

part 'team_stories.g.dart';

class TeamStoriesController = TeamStoriesControllerImpl with _$TeamStoriesController;

abstract class TeamStoriesControllerImpl with Store{

  @observable
  List<int> idPlayerList = [];

  @action 
  bool searchPlayer(List<PlayerModel> list, String position){
    for (var element in list){
      if(position == element.position?.abb){
        if(!idPlayerList.contains(element.id) ){
          return true;
        }
      }
    }
    return false;
  }

  @action
  String playerGol(List<PlayerModel> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.goleiro;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  String playerTec(List<PlayerModel> list){
    return list.isEmpty ? ImagesApp.addPlayer : ImagesApp.tecnico;
  }

  @action
  String player1(List<PlayerModel> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.jogador1;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  String player2(List<PlayerModel> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.jogador2;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  String player3(List<PlayerModel> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.jogador3;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  String? playerName(List<PlayerModel> list, String position){
    if(list.isNotEmpty){
      print(idPlayerList);
      for (var element in list){
        if(position == element.position?.abb){
          if(!idPlayerList.contains(element.id) ){
            idPlayerList.add(element.id!);
            //print(idPlayerList);
            return element.firstname;
          }
        }
      }
    }
    return null;
  }
}