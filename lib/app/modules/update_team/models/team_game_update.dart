class TeamGameUpdate {
  String? name;
  String? abb;
  String? sMethod;

  TeamGameUpdate({this.name, this.abb, this.sMethod});

  TeamGameUpdate.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    abb = json['abb'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['abb'] = abb;
    data['_method'] = sMethod;
    return data;
  }
}
