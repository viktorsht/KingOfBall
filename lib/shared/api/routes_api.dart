import 'package:rei_da_bola/shared/api/api.dart';

class RoutersApi{
  
  static String login = '${Api.urlApi}login';
  static String register = '${Api.urlApi}register';
  static String refresh = '${Api.urlApi}refresh';
  static String me = '${Api.urlApi}me';
  static String soccerMatch = '${Api.urlApi}soccerMatch';
  static String teamGame = '${Api.urlApi}teamGame';
  static String playerEdition = '${Api.urlApi}playerEdition';
  static String championshipEdition = '${Api.urlApi}championshipEdition';
  static String teamGameEdition = '${Api.urlApi}teamGameEdition';
  static String championshipRound = '${Api.urlApi}championshipRound';
  static String checkIdUser = '${Api.urlApi}teamGame?filter=user_id:=:';
  static String roundToday = '${Api.urlApi}soccerMatch/next?date=';
  static String positionAbb = '${Api.urlApi}matchLineup?filter=playerEdition|player|position.abb:=:';
  static String coach =  '${Api.urlApi}app/lineup/coach?filter=championship_edition_id:=:';
  static String score = '${Api.urlApi}app/home/home?team_game_edition_id=';
  static String ranking= '${Api.urlApi}app/ranking/ranking?championship_edition_id=';
<<<<<<< HEAD
  static String lineUp = '${Api.urlApi}app/lineup/lineup';
=======
  static String lineUp = '${Api.urlApi}lineup/lineup';
>>>>>>> bb3d9c9a911a953d5a1c5e18e617bbefc212a283

  String positionName(String position) => 
  '${Api.urlApi}app/lineup/player?filter=player|position.name:=:$position';
  
  String matchGameLineup(String roundId, String teamId) => 
  '${Api.urlApi}app/lineup/lineup?filter=team_game_edition_id:=:$teamId;championship_round_id:=:$roundId}';

}