class PlayerEditionModel {
  int? id;
  int? playerId;
  int? teamEditionId;
  String? createdAt;
  String? updatedAt;
  Player? player;
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
        json['player'] != null ? Player.fromJson(json['player']) : null;
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

class Player {
  int? id;
  String? firstName;
  String? lastName;
  int? number;
  int? positionId;
  int? cityId;
  String? createdAt;
  String? updatedAt;
  Position? position;

  Player(
      {this.id,
      this.firstName,
      this.lastName,
      this.number,
      this.positionId,
      this.cityId,
      this.createdAt,
      this.updatedAt,
      this.position});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    number = json['number'];
    positionId = json['position_id'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    position = json['position'] != null
        ? Position.fromJson(json['position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['number'] = number;
    data['position_id'] = positionId;
    data['city_id'] = cityId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (position != null) {
      data['position'] = position!.toJson();
    }
    return data;
  }
}

class Position {
  int? id;
  String? name;
  String? abb;
  String? createdAt;
  String? updatedAt;

  Position({this.id, this.name, this.abb, this.createdAt, this.updatedAt});

  Position.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abb = json['abb'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abb'] = abb;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class TeamEdition {
  int? id;
  int? teamId;
  int? championshipEditionId;
  int? coachId;
  String? createdAt;
  String? updatedAt;
  Team? team;

  TeamEdition(
      {this.id,
      this.teamId,
      this.championshipEditionId,
      this.coachId,
      this.createdAt,
      this.updatedAt,
      this.team});

  TeamEdition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    championshipEditionId = json['championship_edition_id'];
    coachId = json['coach_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['team_id'] = teamId;
    data['championship_edition_id'] = championshipEditionId;
    data['coach_id'] = coachId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (team != null) {
      data['team'] = team!.toJson();
    }
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? abb;
  int? championshipId;
  String? createdAt;
  String? updatedAt;

  Team(
      {this.id,
      this.name,
      this.abb,
      this.championshipId,
      this.createdAt,
      this.updatedAt});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abb = json['abb'];
    championshipId = json['championship_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abb'] = abb;
    data['championship_id'] = championshipId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
