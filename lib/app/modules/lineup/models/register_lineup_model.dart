class RegisterLineUpModel {
  int? teamGameEditionId;
  int? championshipRoundId;
  List<int>? gameLineup;

  RegisterLineUpModel(
      {this.teamGameEditionId, this.championshipRoundId, this.gameLineup});

  RegisterLineUpModel.fromJson(Map<String, dynamic> json) {
    teamGameEditionId = json['team_game_edition_id'];
    championshipRoundId = json['championship_round_id'];
    gameLineup = json['gameLineup'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_game_edition_id'] = teamGameEditionId;
    data['championship_round_id'] = championshipRoundId;
    data['gameLineup'] = gameLineup;
    return data;
  }
}