
import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/team/models/player_model.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';

part 'buy_store.g.dart';

class BuyStore = BuyStoreImpl with _$BuyStore;

abstract class BuyStoreImpl with Store{

  @observable
  List<PlayerModel> teamList = [];

  @observable
  void updateList(value) => teamList = value;

  @observable
  String stateStoreBuy = StateResponse.start;
  
  @action
  void setTeamList(PlayerModel player) {
    stateStoreBuy = StateResponse.loading;
    teamList.add(player);
    stateStoreBuy = StateResponse.sucess;
    //print('Jogador Adicionado = ${player.playerEdition!.player!.firstname}');
  }

  @action
  List<PlayerModel> getListPlayer() => teamList;

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
  bool get isGolAdd => goleiro == 1; 

  @computed
  bool get isZagAdd => zagueiro == 2;

  @computed
  bool get isLatAdd => lateral == 2;

  @computed
  bool get isMeiAdd => meia == 2;

  @computed
  bool get isVolAdd => volante == 1;
  
  @computed
  bool get isAtaAdd => atacante == 3;
  
  @computed
  bool get isButtonValid => isGolAdd && isLatAdd && isZagAdd && isMeiAdd && isVolAdd && isAtaAdd;

  @action
  void clearState() => stateStoreBuy = StateResponse.start;

  @action
  void addPlayerToVirtualTeam(PlayerModel player){
    String position = player.position!.abb!;
    //print('Jogador = ${player.playerEdition!.player!.firstname}');
    if(position == 'GOL' && !isGolAdd){
      setTeamList(player);
      goleiro++;
    }
    if(position == 'ZAG' && !isZagAdd){
      setTeamList(player);
      zagueiro++;
    }
    if(position == 'LAT' && !isLatAdd){
      setTeamList(player);
      lateral++;
    }
    if(position == 'MEI' && !isMeiAdd){
      setTeamList(player);
      meia++;
    }
    if(position == 'VOL' && !isVolAdd){
      setTeamList(player);
      volante++;
    }
    if(position == 'ATA' && !isAtaAdd){
      setTeamList(player);
      atacante++;
    }
  }
  
}