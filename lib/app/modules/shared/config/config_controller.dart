import 'package:mobx/mobx.dart';
import '../../lineup/models/lu_player_lineup_model.dart';
import '../../start_navigation_bar/modules/football_field/models/football_field_model.dart';
import 'models/config_model.dart';

part 'config_controller.g.dart';

class ConfigController = ConfigControllerImpl with _$ConfigController;

abstract class ConfigControllerImpl with Store{

  @observable
  int edition = 0;

  @action
  void setEdition(value) => edition = value;

  @action
  int getEdition() => edition;

  @observable
  int round = 0;

  @action
  void setRound(value) => round = value;

  @action
  int getRound() => round;

  @observable
  int team = 0;

  @action
  void setTeam(value) => team = value;
  
  @action
  int getTeam() => team;

  @observable
  List<ConfigLineUpPlayer> listMap = [];

  @action
  void setListMap(value) => listMap.add(value);

  @action
  void clearListMap() {
    listMap.clear();
  }

  @action
  bool verificaId(int id){
    bool estaNaLista = false;
    for (var objeto in listMap) {
      if (objeto.id == id) {
        estaNaLista = true;
        break;
      }
    }
    return estaNaLista;
  }

  @action
  void listFootballField(List<FootballFieldModel> list){
    if(list.isNotEmpty){
      for (var element in list){
        if(verificaId(element.id!) == false){
          final body = ConfigLineUpPlayer(
            id: element.id,
            score: element.score,
            firstName:element.playerLineup?.playerEdition?.player?.firstName!,
            lastName: element.playerLineup?.playerEdition?.player?.lastName!,
            position: element.playerLineup?.playerEdition?.player?.position?.name!,
            abbPosition: element.playerLineup?.playerEdition?.player?.position?.abb!,
          );
          setListMap(body);
        }
      }
    }
  }

  @action
  void listPlayerLineUp(PlayerLineUpModel element){
    if(verificaId(element.id!) == false){
      final body = ConfigLineUpPlayer(
        id: element.id,
        score: element.score,
        firstName:element.playerEdition?.player?.firstName!,
        lastName: element.playerEdition?.player?.lastName!,
        position: element.playerEdition?.player?.position?.name!,
        abbPosition: element.playerEdition?.player?.position?.abb!,
      );
      setListMap(body);
    }
  }

  @observable
  List<int> positionListPlayer = [1, 2, 2, 2, 1, 3]; // gol, lat, zag, mei, vol, ata - na ordem
/*
  @action   
  bool isPositionValid(String position){
    int count = 0;
    bool add = false;
    for (var element in listMap){
      if(element.position == position){
        count++;
        if(count >= positionListPlayer[0]){

        }
      }
    }
  }*/

}