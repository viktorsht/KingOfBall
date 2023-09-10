// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on RegisterControllerImpl, Store {
  late final _$stateControllerAtom =
      Atom(name: 'RegisterControllerImpl.stateController', context: context);

  @override
  StateRequest get stateController {
    _$stateControllerAtom.reportRead();
    return super.stateController;
  }

  @override
  set stateController(StateRequest value) {
    _$stateControllerAtom.reportWrite(value, super.stateController, () {
      super.stateController = value;
    });
  }

  late final _$hasEmailAtom =
      Atom(name: 'RegisterControllerImpl.hasEmail', context: context);

  @override
  bool get hasEmail {
    _$hasEmailAtom.reportRead();
    return super.hasEmail;
  }

  @override
  set hasEmail(bool value) {
    _$hasEmailAtom.reportWrite(value, super.hasEmail, () {
      super.hasEmail = value;
    });
  }

  late final _$hasNickAtom =
      Atom(name: 'RegisterControllerImpl.hasNick', context: context);

  @override
  bool get hasNick {
    _$hasNickAtom.reportRead();
    return super.hasNick;
  }

  @override
  set hasNick(bool value) {
    _$hasNickAtom.reportWrite(value, super.hasNick, () {
      super.hasNick = value;
    });
  }

  late final _$userIdAtom =
      Atom(name: 'RegisterControllerImpl.userId', context: context);

  @override
  int? get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(int? value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$registerUserAsyncAction =
      AsyncAction('RegisterControllerImpl.registerUser', context: context);

  @override
  Future<void> registerUser(RegisterUserModel body) {
    return _$registerUserAsyncAction.run(() => super.registerUser(body));
  }

  late final _$RegisterControllerImplActionController =
      ActionController(name: 'RegisterControllerImpl', context: context);

  @override
  void cleanFiels() {
    final _$actionInfo = _$RegisterControllerImplActionController.startAction(
        name: 'RegisterControllerImpl.cleanFiels');
    try {
      return super.cleanFiels();
    } finally {
      _$RegisterControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void contarElementosNoJSON(dynamic exception) {
    final _$actionInfo = _$RegisterControllerImplActionController.startAction(
        name: 'RegisterControllerImpl.contarElementosNoJSON');
    try {
      return super.contarElementosNoJSON(exception);
    } finally {
      _$RegisterControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
hasEmail: ${hasEmail},
hasNick: ${hasNick},
userId: ${userId}
    ''';
  }
}
