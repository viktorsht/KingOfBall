class UserModel {
  String? name;
  String? team;
  String? email;
  String? passowrd;
  String? id;

  UserModel({this.name, this.team, this.email, this.passowrd, this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    team = json['team'];
    email = json['email'];
    passowrd = json['passowrd'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['team'] = team;
    data['email'] = email;
    data['passowrd'] = passowrd;
    data['id'] = id;
    return data;
  }
}