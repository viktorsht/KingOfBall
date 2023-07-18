
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/buy/models/buy_model.dart';

part 'buy_store.g.dart';

class BuyStore = BuyStoreImpl with _$BuyStore;

abstract class BuyStoreImpl with Store{

  @observable
  List<BuyModel> teamList = [];
  
  @action
  void setTeamList(BuyModel player){
    teamList.add(player);
  }

  @action
  void setPlayer(value) => value++;

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
  bool get isButtonValid => !isGolAdd ;


  @action
  void addPlayerToVirtualTeam(BuyModel player){
    String position = player.player!.position!.abb!;
    print(position);
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
    if(position == 'MEI' && meia < 3){
      setTeamList(player);
      meia++;
    }
    if(position == 'VOL' && volante < 3){
      setTeamList(player);
      meia++;
    }
    if(position == 'ATA' && atacante < 3){
      setTeamList(player);
      meia++;
    }
    print(zagueiro);


  }
  
}