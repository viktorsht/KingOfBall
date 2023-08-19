// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'football_field_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FootballFieldStore on FootballFieldStoreImpl, Store {
  late final _$idPlayerListAtom =
      Atom(name: 'FootballFieldStoreImpl.idPlayerList', context: context);

  @override
  List<int> get idPlayerList {
    _$idPlayerListAtom.reportRead();
    return super.idPlayerList;
  }

  @override
  set idPlayerList(List<int> value) {
    _$idPlayerListAtom.reportWrite(value, super.idPlayerList, () {
      super.idPlayerList = value;
    });
  }

  late final _$FootballFieldStoreImplActionController =
      ActionController(name: 'FootballFieldStoreImpl', context: context);

  @override
  List<int> getIdPlayerList() {
    final _$actionInfo = _$FootballFieldStoreImplActionController.startAction(
        name: 'FootballFieldStoreImpl.getIdPlayerList');
    try {
      return super.getIdPlayerList();
    } finally {
      _$FootballFieldStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdPlayerList(dynamic value) {
    final _$actionInfo = _$FootballFieldStoreImplActionController.startAction(
        name: 'FootballFieldStoreImpl.setIdPlayerList');
    try {
      return super.setIdPlayerList(value);
    } finally {
      _$FootballFieldStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool searchPlayer(List<ConfigLineUpPlayer> list, String position) {
    final _$actionInfo = _$FootballFieldStoreImplActionController.startAction(
        name: 'FootballFieldStoreImpl.searchPlayer');
    try {
      return super.searchPlayer(list, position);
    } finally {
      _$FootballFieldStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String playerGol(List<ConfigLineUpPlayer> list, String position) {
    final _$actionInfo = _$FootballFieldStoreImplActionController.startAction(
        name: 'FootballFieldStoreImpl.playerGol');
    try {
      return super.playerGol(list, position);
    } finally {
      _$FootballFieldStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String playerTec(List<CoachModel> list) {
    final _$actionInfo = _$FootballFieldStoreImplActionController.startAction(
        name: 'FootballFieldStoreImpl.playerTec');
    try {
      return super.playerTec(list);
    } finally {
      _$FootballFieldStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String player1(List<ConfigLineUpPlayer> list, String position) {
    final _$actionInfo = _$FootballFieldStoreImplActionController.startAction(
        name: 'FootballFieldStoreImpl.player1');
    try {
      return super.player1(list, position);
    } finally {
      _$FootballFieldStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String player2(List<ConfigLineUpPlayer> list, String position) {
    final _$actionInfo = _$FootballFieldStoreImplActionController.startAction(
        name: 'FootballFieldStoreImpl.player2');
    try {
      return super.player2(list, position);
    } finally {
      _$FootballFieldStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String player3(List<ConfigLineUpPlayer> list, String position) {
    final _$actionInfo = _$FootballFieldStoreImplActionController.startAction(
        name: 'FootballFieldStoreImpl.player3');
    try {
      return super.player3(list, position);
    } finally {
      _$FootballFieldStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  ConfigLineUpPlayer? playerName(
      List<ConfigLineUpPlayer> list, String position) {
    final _$actionInfo = _$FootballFieldStoreImplActionController.startAction(
        name: 'FootballFieldStoreImpl.playerName');
    try {
      return super.playerName(list, position);
    } finally {
      _$FootballFieldStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<int> retornaListaPlayer(List<ConfigLineUpPlayer> list) {
    final _$actionInfo = _$FootballFieldStoreImplActionController.startAction(
        name: 'FootballFieldStoreImpl.retornaListaPlayer');
    try {
      return super.retornaListaPlayer(list);
    } finally {
      _$FootballFieldStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isValidButton(int value) {
    final _$actionInfo = _$FootballFieldStoreImplActionController.startAction(
        name: 'FootballFieldStoreImpl.isValidButton');
    try {
      return super.isValidButton(value);
    } finally {
      _$FootballFieldStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idPlayerList: ${idPlayerList}
    ''';
  }
}
