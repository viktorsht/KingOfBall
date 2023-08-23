// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_team_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateTeamStore on UpdateTeamStoreImpl, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'UpdateTeamStoreImpl.isFormValid'))
          .value;

  late final _$sucessUpdateAtom =
      Atom(name: 'UpdateTeamStoreImpl.sucessUpdate', context: context);

  @override
  bool get sucessUpdate {
    _$sucessUpdateAtom.reportRead();
    return super.sucessUpdate;
  }

  @override
  set sucessUpdate(bool value) {
    _$sucessUpdateAtom.reportWrite(value, super.sucessUpdate, () {
      super.sucessUpdate = value;
    });
  }

  late final _$nameTeamAtom =
      Atom(name: 'UpdateTeamStoreImpl.nameTeam', context: context);

  @override
  String get nameTeam {
    _$nameTeamAtom.reportRead();
    return super.nameTeam;
  }

  @override
  set nameTeam(String value) {
    _$nameTeamAtom.reportWrite(value, super.nameTeam, () {
      super.nameTeam = value;
    });
  }

  late final _$abbTeamAtom =
      Atom(name: 'UpdateTeamStoreImpl.abbTeam', context: context);

  @override
  String get abbTeam {
    _$abbTeamAtom.reportRead();
    return super.abbTeam;
  }

  @override
  set abbTeam(String value) {
    _$abbTeamAtom.reportWrite(value, super.abbTeam, () {
      super.abbTeam = value;
    });
  }

  late final _$UpdateTeamStoreImplActionController =
      ActionController(name: 'UpdateTeamStoreImpl', context: context);

  @override
  void setSucessRegister() {
    final _$actionInfo = _$UpdateTeamStoreImplActionController.startAction(
        name: 'UpdateTeamStoreImpl.setSucessRegister');
    try {
      return super.setSucessRegister();
    } finally {
      _$UpdateTeamStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNameTeam(String value) {
    final _$actionInfo = _$UpdateTeamStoreImplActionController.startAction(
        name: 'UpdateTeamStoreImpl.setNameTeam');
    try {
      return super.setNameTeam(value);
    } finally {
      _$UpdateTeamStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAbbTeam(String value) {
    final _$actionInfo = _$UpdateTeamStoreImplActionController.startAction(
        name: 'UpdateTeamStoreImpl.setAbbTeam');
    try {
      return super.setAbbTeam(value);
    } finally {
      _$UpdateTeamStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearValues() {
    final _$actionInfo = _$UpdateTeamStoreImplActionController.startAction(
        name: 'UpdateTeamStoreImpl.clearValues');
    try {
      return super.clearValues();
    } finally {
      _$UpdateTeamStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sucessUpdate: ${sucessUpdate},
nameTeam: ${nameTeam},
abbTeam: ${abbTeam},
isFormValid: ${isFormValid}
    ''';
  }
}
