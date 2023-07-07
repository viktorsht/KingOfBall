// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerImpl, Store {
  late final _$stateControllerAtom =
      Atom(name: 'LoginControllerImpl.stateController', context: context);

  @override
  String get stateController {
    _$stateControllerAtom.reportRead();
    return super.stateController;
  }

  @override
  set stateController(String value) {
    _$stateControllerAtom.reportWrite(value, super.stateController, () {
      super.stateController = value;
    });
  }

  late final _$tokenAtom =
      Atom(name: 'LoginControllerImpl.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginControllerImpl.login', context: context);

  @override
  Future<String> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$LoginControllerImplActionController =
      ActionController(name: 'LoginControllerImpl', context: context);

  @override
  void setStateController(String value) {
    final _$actionInfo = _$LoginControllerImplActionController.startAction(
        name: 'LoginControllerImpl.setStateController');
    try {
      return super.setStateController(value);
    } finally {
      _$LoginControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
token: ${token}
    ''';
  }
}
