import 'package:mobx/mobx.dart';
import '../../../../../../design_system/images/images_app.dart';
import '../submodules/buy/models/player_edition_model.dart';

part 'team_stories.g.dart';

class TeamStoriesController = TeamStoriesControllerImpl with _$TeamStoriesController;

abstract class TeamStoriesControllerImpl with Store{

  @action
  String playerGol(List<PlayerEditionModel> list){
    return list.isEmpty ? ImagesApp.addPlayer : ImagesApp.goleiro;
  }

  @action
  String playerTec(List<PlayerEditionModel> list){
    return list.isEmpty ? ImagesApp.addPlayer : ImagesApp.tecnico;
  }

  @action
  String player1(List<PlayerEditionModel> list){
    return list.isEmpty ? ImagesApp.addPlayer : ImagesApp.jogador1;
  }

  @action
  String player2(List<PlayerEditionModel> list){
    return list.isEmpty ? ImagesApp.addPlayer : ImagesApp.jogador2;
  }

  @action
  String player3(List<PlayerEditionModel> list){
    return list.isEmpty ? ImagesApp.addPlayer : ImagesApp.jogador3;
  }

  @action
  String? playerName(List<PlayerEditionModel> list, int index){
    return list.isEmpty ? null : list[index].playerEdition?.player!.firstname;
  }
}