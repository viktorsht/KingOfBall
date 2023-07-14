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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['abb'] = this.abb;
    data['championship_id'] = this.championshipId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}