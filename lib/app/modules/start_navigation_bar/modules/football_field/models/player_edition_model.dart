import 'package:rei_da_bola/app/modules/shared/models/player_model.dart';

class PlayerEditionModel {
  int? id;
  int? playerId;
  int? teamEditionId;
  String? createdAt;
  String? updatedAt;
  PlayerModel? player;

  PlayerEditionModel(
      {this.id,
      this.playerId,
      this.teamEditionId,
      this.createdAt,
      this.updatedAt,
      this.player,
      });

  PlayerEditionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerId = json['player_id'];
    teamEditionId = json['team_edition_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    player =
        json['player'] != null ? PlayerModel.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['player_id'] = playerId;
    data['team_edition_id'] = teamEditionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (player != null) {
      data['player'] = player!.toJson();
    }
    return data;
  }
}