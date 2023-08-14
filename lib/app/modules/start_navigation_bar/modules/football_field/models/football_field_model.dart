import 'player_lineup_model.dart';

class FootballFieldModel {
  int? id;
  int? teamGameEditionId;
  int? playerLineupId;
  int? championshipRoundId;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? score;
  int? matchLineupId;
  PlayerLineup? playerLineup;

  FootballFieldModel(
      {this.id,
      this.teamGameEditionId,
      this.playerLineupId,
      this.championshipRoundId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.score,
      this.matchLineupId,
      this.playerLineup});

  FootballFieldModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamGameEditionId = json['team_game_edition_id'];
    playerLineupId = json['player_lineup_id'];
    championshipRoundId = json['championship_round_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    score = json['score'];
    matchLineupId = json['match_lineup_id'];
    playerLineup = json['player_lineup'] != null
        ? PlayerLineup.fromJson(json['player_lineup'],)
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
    data['score'] = score;
    data['match_lineup_id'] = matchLineupId;
    if (playerLineup != null) {
      data['player_lineup'] = playerLineup!.toJson();
    }
    return data;
  }
}