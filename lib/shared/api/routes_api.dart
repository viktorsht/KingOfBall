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
  static String matchGameLineupPost = '${Api.urlApi}matchGameLineup';
  static String score = '${Api.urlApi}app/home/home?team_game_edition_id=';
  static String ranking= '${Api.urlApi}app/ranking/ranking?championship_edition_id=';

  String positionName(String position, String roundId, String editionId) => 
  '${Api.urlApi}app/lineup/player?filter=soccerMatch|championshipEdition.id:=:$editionId;soccerMatch.championship_round_id:=:$roundId;playerEdition|player|position.name:=:$position';
  
  String matchGameLineup(String roundId, String teamId) => 
  '${Api.urlApi}app/lineup/lineup?filter=championshipRound.id:=:$roundId;team_game_edition_id:=:$teamId';


}