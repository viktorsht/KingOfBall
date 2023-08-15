// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfigController on ConfigControllerImpl, Store {
  late final _$editionAtom =
      Atom(name: 'ConfigControllerImpl.edition', context: context);

  @override
  int get edition {
    _$editionAtom.reportRead();
    return super.edition;
  }

  @override
  set edition(int value) {
    _$editionAtom.reportWrite(value, super.edition, () {
      super.edition = value;
    });
  }

  late final _$roundAtom =
      Atom(name: 'ConfigControllerImpl.round', context: context);

  @override
  int get round {
    _$roundAtom.reportRead();
    return super.round;
  }

  @override
  set round(int value) {
    _$roundAtom.reportWrite(value, super.round, () {
      super.round = value;
    });
  }

  late final _$teamAtom =
      Atom(name: 'ConfigControllerImpl.team', context: context);

  @override
  int get team {
    _$teamAtom.reportRead();
    return super.team;
  }

  @override
  set team(int value) {
    _$teamAtom.reportWrite(value, super.team, () {
      super.team = value;
    });
  }

  late final _$ConfigControllerImplActionController =
      ActionController(name: 'ConfigControllerImpl', context: context);

  @override
  void setEdition(dynamic value) {
    final _$actionInfo = _$ConfigControllerImplActionController.startAction(
        name: 'ConfigControllerImpl.setEdition');
    try {
      return super.setEdition(value);
    } finally {
      _$ConfigControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getEdition() {
    final _$actionInfo = _$ConfigControllerImplActionController.startAction(
        name: 'ConfigControllerImpl.getEdition');
    try {
      return super.getEdition();
    } finally {
      _$ConfigControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRound(dynamic value) {
    final _$actionInfo = _$ConfigControllerImplActionController.startAction(
        name: 'ConfigControllerImpl.setRound');
    try {
      return super.setRound(value);
    } finally {
      _$ConfigControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getRound() {
    final _$actionInfo = _$ConfigControllerImplActionController.startAction(
        name: 'ConfigControllerImpl.getRound');
    try {
      return super.getRound();
    } finally {
      _$ConfigControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTeam(dynamic value) {
    final _$actionInfo = _$ConfigControllerImplActionController.startAction(
        name: 'ConfigControllerImpl.setTeam');
    try {
      return super.setTeam(value);
    } finally {
      _$ConfigControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getTeam() {
    final _$actionInfo = _$ConfigControllerImplActionController.startAction(
        name: 'ConfigControllerImpl.getTeam');
    try {
      return super.getTeam();
    } finally {
      _$ConfigControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
edition: ${edition},
round: ${round},
team: ${team}
    ''';
  }
}
