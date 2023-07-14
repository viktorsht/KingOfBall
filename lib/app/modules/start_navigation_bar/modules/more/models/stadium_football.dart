class StadiumFootball {
  int? id;
  String? name;
  int? cityId;
  String? createdAt;
  String? updatedAt;

  StadiumFootball(
      {this.id, this.name, this.cityId, this.createdAt, this.updatedAt});

  StadiumFootball.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}