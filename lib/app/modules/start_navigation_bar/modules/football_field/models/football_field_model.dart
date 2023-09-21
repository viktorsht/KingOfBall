import 'player_edition_model.dart';

class FootballFieldModel {
  int? id;
  int? teamGameEditionId;
  int? playerLineupId;
  int? championshipRoundId;
  int? status;
  String? createdAt;
  String? updatedAt;
  TeamGameEdition? teamGameEdition;
  PlayerEditionModel? playerEdition;

  FootballFieldModel(
      {this.id,
      this.teamGameEditionId,
      this.playerLineupId,
      this.championshipRoundId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.teamGameEdition,
      this.playerEdition});

  FootballFieldModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamGameEditionId = json['team_game_edition_id'];
    playerLineupId = json['player_lineup_id'];
    championshipRoundId = json['championship_round_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teamGameEdition = json['team_game_edition'] != null
        ? TeamGameEdition.fromJson(json['team_game_edition'])
        : null;
    playerEdition = json['player_edition'] != null
        ? PlayerEditionModel.fromJson(json['player_edition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['team_game_edition_id'] = teamGameEditionId;
    data['player_lineup_id'] = playerLineupId;
    data['championship_round_id'] = championshipRoundId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (teamGameEdition != null) {
      data['team_game_edition'] = teamGameEdition!.toJson();
    }
    if (playerEdition != null) {
      data['player_edition'] = playerEdition!.toJson();
    }
    return data;
  }
}

class TeamGameEdition {
  int? id;
  int? teamGameId;
  int? championshipEditionId;
  String? createdAt;
  String? updatedAt;

  TeamGameEdition(
      {this.id,
      this.teamGameId,
      this.championshipEditionId,
      this.createdAt,
      this.updatedAt});

  TeamGameEdition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamGameId = json['team_game_id'];
    championshipEditionId = json['championship_edition_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['team_game_id'] = teamGameId;
    data['championship_edition_id'] = championshipEditionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
