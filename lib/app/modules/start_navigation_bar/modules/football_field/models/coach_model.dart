import '../../more/models/champion_ship_edition.dart';

class CoachModel {
  int? id;
  int? teamId;
  int? championshipEditionId;
  int? coachId;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  int? cityId;
  ChampionshipEdition? championshipEdition;

  CoachModel(
      {this.id,
      this.teamId,
      this.championshipEditionId,
      this.coachId,
      this.createdAt,
      this.updatedAt,
      this.firstName,
      this.lastName,
      this.cityId,
      this.championshipEdition});

  CoachModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    championshipEditionId = json['championship_edition_id'];
    coachId = json['coach_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    cityId = json['city_id'];
    championshipEdition = json['championship_edition'] != null
        ? ChampionshipEdition.fromJson(json['championship_edition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['team_id'] = teamId;
    data['championship_edition_id'] = championshipEditionId;
    data['coach_id'] = coachId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['city_id'] = cityId;
    if (championshipEdition != null) {
      data['championship_edition'] = championshipEdition!.toJson();
    }
    return data;
  }
}
