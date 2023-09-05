import 'package:rei_da_bola/app/value_object/email.dart';
import 'package:rei_da_bola/app/value_object/name.dart';
import 'package:rei_da_bola/app/value_object/nick.dart';
import 'package:rei_da_bola/app/value_object/password.dart';

class RegisterUserModel {
  Email _email;
  Password _password;
  Nick _nick;
  Name _firstName;
  Name _lastName;

  Email get email => _email;
  void setEmail(String value) => _email = Email(value);

  Password get password => _password;
  void setPassword(String value) => _password = Password(value);

  Nick get nick => _nick;
  void setNick(String value) => _nick = Nick(value);

  Name get firstName => _firstName;
  void setFirstName(String value) => _firstName = Name(value);

  Name get lastName => _lastName;
  void setLastName(String value) => _lastName = Name(value);

  RegisterUserModel({
    required String email, 
    required String password, 
    required String nick, 
    required String firstName, 
    required String lastName
  }) :  _email = Email(email),
        _password = Password(password),
        _nick = Nick(nick),
        _firstName = Name(firstName),
        _lastName = Name(lastName);
  
  factory RegisterUserModel.empty(){
    return RegisterUserModel(
      email: '',
      password: '',
      nick: '',
      firstName: '',
      lastName: ''
    );
  }

  static RegisterUserModel fromJson(Map<String, dynamic> json) {
    return RegisterUserModel(
      email : json['email'],
      password : json['password'],
      nick : json['nick'],
      firstName : json['first_name'],
      lastName : json['last_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email.toString();
    data['password'] = password.toString();
    data['nick'] = nick.toString();
    data['first_name'] = firstName.toString();
    data['last_name'] = lastName.toString();
    return data;
  }
}
