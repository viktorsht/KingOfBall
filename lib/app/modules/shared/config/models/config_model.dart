class ConfigLineUpPlayer {
  int? id;
  String? score;
  String? firstName;
  String? lastName;
  String? position;
  String? abbPosition;

  ConfigLineUpPlayer(
      {this.id,
      this.score,
      this.firstName,
      this.lastName,
      this.position,
      this.abbPosition});

  ConfigLineUpPlayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    score = json['score'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    position = json['position'];
    abbPosition = json['abb_position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['score'] = score;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['position'] = position;
    data['abb_position'] = abbPosition;
    return data;
  }
}
