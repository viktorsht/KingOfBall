import 'package:mobx/mobx.dart';
import '../../../../../../design_system/images/images_app.dart';
import '../../../../shared/config/models/config_model.dart';
part 'football_field_store.g.dart';

class FootballFieldStore = FootballFieldStoreImpl with _$FootballFieldStore;

abstract class FootballFieldStoreImpl with Store{

  @observable
  List<int> idPlayerList = [];

  @action
  List<int> getIdPlayerList() => idPlayerList;

  @action
  void setIdPlayerList(value) => idPlayerList.add(value);

  @action 
  bool searchPlayer(List<ConfigLineUpPlayer> list, String position){
    for (var element in list){
      if(position == element.abbPosition){
        if(!idPlayerList.contains(element.id) ){
          return true;
        }
      }
    }
    return false;
  }

  @action
  String playerGol(List<ConfigLineUpPlayer> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.goleiro;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  String player1(List<ConfigLineUpPlayer> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.jogador1;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  String player2(List<ConfigLineUpPlayer> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.jogador2;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  String player3(List<ConfigLineUpPlayer> list, String position){
    if(list.isNotEmpty){
      if(searchPlayer(list, position) == true){
        return ImagesApp.jogador3;
      }
    }
    return ImagesApp.addPlayer;
  }

  @action
  ConfigLineUpPlayer? playerName(List<ConfigLineUpPlayer> list, String position){
    if(list.isNotEmpty){
      for (var element in list){
        if(position == element.abbPosition){
          if(!idPlayerList.contains(element.id)){
            setIdPlayerList(element.id);
            return element;
            //print(idPlayerList);
          }
        }
      }
    }
    return null;
  }

  @action
  List<int> retornaListaPlayer(List<ConfigLineUpPlayer> list){
    if(list.isNotEmpty){
      for (var element in list){
        if(!idPlayerList.contains(element.id)){
          setIdPlayerList(element.id);
        }
      }
    }
    return idPlayerList;
  }

  @action
  bool isValidButton(int value) {
    for(var element in idPlayerList){
      if(element == value){
        return true;
      }
    }
    return false;
  } 
}