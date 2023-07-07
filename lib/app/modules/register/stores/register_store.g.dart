// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on RegisterStoreImpl, Store {
  Computed<bool>? _$isUserValidComputed;

  @override
  bool get isUserValid =>
      (_$isUserValidComputed ??= Computed<bool>(() => super.isUserValid,
              name: 'RegisterStoreImpl.isUserValid'))
          .value;
  Computed<bool>? _$isTeamValidComputed;

  @override
  bool get isTeamValid =>
      (_$isTeamValidComputed ??= Computed<bool>(() => super.isTeamValid,
              name: 'RegisterStoreImpl.isTeamValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: 'RegisterStoreImpl.isPasswordValid'))
          .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: 'RegisterStoreImpl.isEmailValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'RegisterStoreImpl.isFormValid'))
          .value;

  late final _$userAtom =
      Atom(name: 'RegisterStoreImpl.user', context: context);

  @override
  String get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$teamAtom =
      Atom(name: 'RegisterStoreImpl.team', context: context);

  @override
  String get team {
    _$teamAtom.reportRead();
    return super.team;
  }

  @override
  set team(String value) {
    _$teamAtom.reportWrite(value, super.team, () {
      super.team = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'RegisterStoreImpl.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'RegisterStoreImpl.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordLookAtom =
      Atom(name: 'RegisterStoreImpl.passwordLook', context: context);

  @override
  bool get passwordLook {
    _$passwordLookAtom.reportRead();
    return super.passwordLook;
  }

  @override
  set passwordLook(bool value) {
    _$passwordLookAtom.reportWrite(value, super.passwordLook, () {
      super.passwordLook = value;
    });
  }

  late final _$RegisterStoreImplActionController =
      ActionController(name: 'RegisterStoreImpl', context: context);

  @override
  void setUser(String value) {
    final _$actionInfo = _$RegisterStoreImplActionController.startAction(
        name: 'RegisterStoreImpl.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$RegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTeam(String value) {
    final _$actionInfo = _$RegisterStoreImplActionController.startAction(
        name: 'RegisterStoreImpl.setTeam');
    try {
      return super.setTeam(value);
    } finally {
      _$RegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$RegisterStoreImplActionController.startAction(
        name: 'RegisterStoreImpl.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$RegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$RegisterStoreImplActionController.startAction(
        name: 'RegisterStoreImpl.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$RegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordLook() {
    final _$actionInfo = _$RegisterStoreImplActionController.startAction(
        name: 'RegisterStoreImpl.togglePasswordLook');
    try {
      return super.togglePasswordLook();
    } finally {
      _$RegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
team: ${team},
email: ${email},
password: ${password},
passwordLook: ${passwordLook},
isUserValid: ${isUserValid},
isTeamValid: ${isTeamValid},
isPasswordValid: ${isPasswordValid},
isEmailValid: ${isEmailValid},
isFormValid: ${isFormValid}
    ''';
  }
}
