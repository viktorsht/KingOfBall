
import 'package:mobx/mobx.dart';
import '../models/player_edition_model.dart';

part 'buy_store.g.dart';

class BuyStore = BuyStoreImpl with _$BuyStore;

abstract class BuyStoreImpl with Store{

  @observable
  List<PlayerEditionModel> teamList = [];
  
  @action
  void setTeamList(PlayerEditionModel player){
    teamList.add(player);
    print('Jogador Adicionado = ${player.playerEdition!.player!.firstname}');
  }

  @action
  List<PlayerEditionModel> getListPlayer() => teamList;

  @observable
  int goleiro = 0;

  @observable
  int zagueiro = 0;

  @observable
  int lateral = 0;

  @observable
  int meia = 0;

  @observable
  int volante = 0;

  @observable
  int atacante = 0;

  @computed
  bool get isGolAdd => goleiro != 0; 

  @computed
  bool get isZagAdd => zagueiro < 2;

  @computed
  bool get isButtonValid => true ;


  @action
  void addPlayerToVirtualTeam(PlayerEditionModel player){
    String position = player.playerEdition!.player!.position!.abb!;
    //print('Jogador = ${player.playerEdition!.player!.firstname}');
    if(position == 'GOL' && goleiro == 0){
      setTeamList(player);
      goleiro++;
    }
    if(position == 'ZAG' && zagueiro < 2){
      setTeamList(player);
      zagueiro++;
    }
    if(position == 'LAT' && lateral < 2){
      setTeamList(player);
      lateral++;
    }
    if(position == 'MEI' && meia < 2){
      setTeamList(player);
      meia++;
    }
    if(position == 'VOL' && volante < 1){
      setTeamList(player);
      volante++;
    }
    if(position == 'ATA' && atacante < 3){
      setTeamList(player);
      atacante++;
    }

  }
  
}