import 'player_edition_model.dart';

class PlayerLineup {
  int? id;
  int? playerEditionId;
  int? soccerMatchId;
  int? statusLineupId;
  String? createdAt;
  String? updatedAt;
  PlayerEditionModel? playerEdition;

  PlayerLineup(
      {this.id,
      this.playerEditionId,
      this.soccerMatchId,
      this.statusLineupId,
      this.createdAt,
      this.updatedAt,
      this.playerEdition});

  PlayerLineup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerEditionId = json['player_edition_id'];
    soccerMatchId = json['soccer_match_id'];
    statusLineupId = json['status_lineup_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    playerEdition = json['player_edition'] != null
        ? PlayerEditionModel.fromJson(json['player_edition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['player_edition_id'] = playerEditionId;
    data['soccer_match_id'] = soccerMatchId;
    data['status_lineup_id'] = statusLineupId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (playerEdition != null) {
      data['player_edition'] = playerEdition!.toJson();
    }
    return data;
  }
}