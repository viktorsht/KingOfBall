import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/football_field/models/player_model.dart';
import '../../../../shared/models/team_edition.dart';

class PlayerEditionModel {
  int? id;
  int? playerId;
  int? teamEditionId;
  String? createdAt;
  String? updatedAt;
  PlayerModel? player;
  TeamEdition? teamEdition;

  PlayerEditionModel(
      {this.id,
      this.playerId,
      this.teamEditionId,
      this.createdAt,
      this.updatedAt,
      this.player,
      this.teamEdition});

  PlayerEditionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerId = json['player_id'];
    teamEditionId = json['team_edition_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    player =
        json['player'] != null ? PlayerModel.fromJson(json['player']) : null;
    teamEdition = json['team_edition'] != null
        ? TeamEdition.fromJson(json['team_edition'])
        : null;
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
    if (teamEdition != null) {
      data['team_edition'] = teamEdition!.toJson();
    }
    return data;
  }
}