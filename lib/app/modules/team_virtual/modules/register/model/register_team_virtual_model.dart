import 'package:rei_da_bola/app/value_object/abreviacao_team.dart';
import 'package:rei_da_bola/app/value_object/name.dart';

class RegisterTeamVirtualModel {
  int _userId;
  Name _name;
  AbreviacaoTeam _abb;

  int get userid => _userId;
  void setUserId(int value) => _userId = value;

  Name get name => _name;
  void setName(String value) => _name = Name(value);

  AbreviacaoTeam get abb => _abb;
  void setAbreviacaoTeam(String value) => _abb = AbreviacaoTeam(value);

  RegisterTeamVirtualModel({
    required int userId,
    required String name,
    required String abb 
  })  : _userId = userId,
        _name = Name(name),
        _abb = AbreviacaoTeam(abb);
  
  factory RegisterTeamVirtualModel.empty() => RegisterTeamVirtualModel(name: '', abb: '', userId: -1);
  
  static RegisterTeamVirtualModel fromJson(Map<String, dynamic> json) {
    return RegisterTeamVirtualModel(
      name : json['name'],
      abb : json['abb'],
      userId : json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name.toString();
    data['abb'] = abb.toString();
    data['user_id'] = _userId;
    return data;
  }
}
