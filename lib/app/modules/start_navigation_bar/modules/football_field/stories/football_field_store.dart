import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/models/coach_model.dart';
import '../../../../../../design_system/images/images_app.dart';
import '../models/football_field_model.dart';
part 'football_field_store.g.dart';

class FootballFieldStore = FootballFieldStoreImpl with _$FootballFieldStore;

abstract class FootballFieldStoreImpl with Store{

  @observable
  List<int> idPlayerList = [];

  @action 
  bool searchPlayer(List<FootballFieldModel> list, String position){
    for (var element in list){
      if(position == element.playerLineup?.playerEdition?.player?.position?.abb){
        if(!idPlayerList.contains(element.id) ){
          return true;
        }
      }
    }
    return false;
  }

  @action
  String playerGol(List<FootballFieldModel> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.goleiro;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  String playerTec(List<CoachModel> list){
    return list.isEmpty ? ImagesApp.addPlayer : ImagesApp.tecnico;
  }

  @action
  String player1(List<FootballFieldModel> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.jogador1;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  String player2(List<FootballFieldModel> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.jogador2;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  String player3(List<FootballFieldModel> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.jogador3;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  FootballFieldModel? playerName(List<FootballFieldModel> list, String position){
    if(list.isNotEmpty){
      //print(idPlayerList);
      for (var element in list){
        if(position == element.playerLineup?.playerEdition?.player?.position?.abb){
          if(!idPlayerList.contains(element.id) ){
            idPlayerList.add(element.id!);
            print(idPlayerList);
            return element;
          }
        }
      }
    }
    return null;
  }

  @action
  CoachModel? playerNameCoach(List<CoachModel> list){
    if(list.isNotEmpty){
      for (var element in list){
        return element;
      }
    }
    return null;
  }
}