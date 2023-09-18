import 'package:flutter_test/flutter_test.dart';
import 'package:rei_da_bola/app/modules/login/models/login_model.dart';

void main() {
  test('login model ...', (){

    LoginModel login = LoginModel(email: '123@gmail.com', password: '456');
    expect(login.email.toString(), '123@gmail.com');
    expect(login.password.toString(), '456');
  });

  test('login model empty', (){

    LoginModel login = LoginModel.empty();
    expect(login.email.toString(), '');
    expect(login.password.toString(), '');
  });

  test('login model fromJson (vazio)', (){

    LoginModel login = LoginModel.fromJson({});
    expect(login.email.toString(), '');
    expect(login.password.toString(), '');
  });

  test('login model fromJson', (){

    LoginModel login = LoginModel.fromJson({'email': '123@gmail.com', 'password' : '456'});
    expect(login.email.toString(), '123@gmail.com');
    expect(login.password.toString(), '456');
  });
}