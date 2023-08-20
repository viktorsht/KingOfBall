class RankingModel {
  int? teamGameEditionId;
  String? score;
  TeamGameEdition? teamGameEdition;

  RankingModel({this.teamGameEditionId, this.score, this.teamGameEdition});

  RankingModel.fromJson(Map<String, dynamic> json) {
    teamGameEditionId = json['team_game_edition_id'];
    score = json['score'];
    teamGameEdition = json['team_game_edition'] != null
        ? TeamGameEdition.fromJson(json['team_game_edition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_game_edition_id'] = teamGameEditionId;
    data['score'] = score;
    if (teamGameEdition != null) {
      data['team_game_edition'] = teamGameEdition!.toJson();
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
  TeamGame? teamGame;

  TeamGameEdition(
      {this.id,
      this.teamGameId,
      this.championshipEditionId,
      this.createdAt,
      this.updatedAt,
      this.teamGame});

  TeamGameEdition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamGameId = json['team_game_id'];
    championshipEditionId = json['championship_edition_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teamGame = json['team_game'] != null
        ? TeamGame.fromJson(json['team_game'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['team_game_id'] = teamGameId;
    data['championship_edition_id'] = championshipEditionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (teamGame != null) {
      data['team_game'] = teamGame!.toJson();
    }
    return data;
  }
}

class TeamGame {
  int? id;
  String? name;
  String? abb;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  TeamGame(
      {this.id,
      this.name,
      this.abb,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user});

  TeamGame.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abb = json['abb'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abb'] = abb;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? emailVerifiedAt;
  String? firstName;
  String? lastName;
  String? nick;
  int? accessLevelId;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.email,
      this.emailVerifiedAt,
      this.firstName,
      this.lastName,
      this.nick,
      this.accessLevelId,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    nick = json['nick'];
    accessLevelId = json['access_level_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['nick'] = nick;
    data['access_level_id'] = accessLevelId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
