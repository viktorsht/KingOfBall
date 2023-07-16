import 'package:rei_da_bola/app/modules/buy/models/player_model.dart';

import '../../shared/models/team_edition.dart';

class BuyModel {
  int? id;
  int? playerId;
  int? teamEditionId;
  String? createdAt;
  String? updatedAt;
  PlayerModel? player;
  TeamEdition? teamEdition;

  BuyModel(
      {this.id,
      this.playerId,
      this.teamEditionId,
      this.createdAt,
      this.updatedAt,
      this.player,
      this.teamEdition});

  BuyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerId = json['player_id'];
    teamEditionId = json['team_edition_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    player =
        json['player'] != null ? new PlayerModel.fromJson(json['player']) : null;
    teamEdition = json['team_edition'] != null
        ? new TeamEdition.fromJson(json['team_edition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['player_id'] = this.playerId;
    data['team_edition_id'] = this.teamEditionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.teamEdition != null) {
      data['team_edition'] = this.teamEdition!.toJson();
    }
    return data;
  }
}