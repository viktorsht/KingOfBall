// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BuyStore on BuyStoreImpl, Store {
  Computed<bool>? _$isGolAddComputed;

  @override
  bool get isGolAdd => (_$isGolAddComputed ??=
          Computed<bool>(() => super.isGolAdd, name: 'BuyStoreImpl.isGolAdd'))
      .value;
  Computed<bool>? _$isZagAddComputed;

  @override
  bool get isZagAdd => (_$isZagAddComputed ??=
          Computed<bool>(() => super.isZagAdd, name: 'BuyStoreImpl.isZagAdd'))
      .value;
  Computed<bool>? _$isButtonValidComputed;

  @override
  bool get isButtonValid =>
      (_$isButtonValidComputed ??= Computed<bool>(() => super.isButtonValid,
              name: 'BuyStoreImpl.isButtonValid'))
          .value;

  late final _$teamListAtom =
      Atom(name: 'BuyStoreImpl.teamList', context: context);

  @override
  List<BuyModel> get teamList {
    _$teamListAtom.reportRead();
    return super.teamList;
  }

  @override
  set teamList(List<BuyModel> value) {
    _$teamListAtom.reportWrite(value, super.teamList, () {
      super.teamList = value;
    });
  }

  late final _$goleiroAtom =
      Atom(name: 'BuyStoreImpl.goleiro', context: context);

  @override
  int get goleiro {
    _$goleiroAtom.reportRead();
    return super.goleiro;
  }

  @override
  set goleiro(int value) {
    _$goleiroAtom.reportWrite(value, super.goleiro, () {
      super.goleiro = value;
    });
  }

  late final _$zagueiroAtom =
      Atom(name: 'BuyStoreImpl.zagueiro', context: context);

  @override
  int get zagueiro {
    _$zagueiroAtom.reportRead();
    return super.zagueiro;
  }

  @override
  set zagueiro(int value) {
    _$zagueiroAtom.reportWrite(value, super.zagueiro, () {
      super.zagueiro = value;
    });
  }

  late final _$lateralAtom =
      Atom(name: 'BuyStoreImpl.lateral', context: context);

  @override
  int get lateral {
    _$lateralAtom.reportRead();
    return super.lateral;
  }

  @override
  set lateral(int value) {
    _$lateralAtom.reportWrite(value, super.lateral, () {
      super.lateral = value;
    });
  }

  late final _$meiaAtom = Atom(name: 'BuyStoreImpl.meia', context: context);

  @override
  int get meia {
    _$meiaAtom.reportRead();
    return super.meia;
  }

  @override
  set meia(int value) {
    _$meiaAtom.reportWrite(value, super.meia, () {
      super.meia = value;
    });
  }

  late final _$volanteAtom =
      Atom(name: 'BuyStoreImpl.volante', context: context);

  @override
  int get volante {
    _$volanteAtom.reportRead();
    return super.volante;
  }

  @override
  set volante(int value) {
    _$volanteAtom.reportWrite(value, super.volante, () {
      super.volante = value;
    });
  }

  late final _$atacanteAtom =
      Atom(name: 'BuyStoreImpl.atacante', context: context);

  @override
  int get atacante {
    _$atacanteAtom.reportRead();
    return super.atacante;
  }

  @override
  set atacante(int value) {
    _$atacanteAtom.reportWrite(value, super.atacante, () {
      super.atacante = value;
    });
  }

  late final _$BuyStoreImplActionController =
      ActionController(name: 'BuyStoreImpl', context: context);

  @override
  void setTeamList(BuyModel player) {
    final _$actionInfo = _$BuyStoreImplActionController.startAction(
        name: 'BuyStoreImpl.setTeamList');
    try {
      return super.setTeamList(player);
    } finally {
      _$BuyStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlayer(dynamic value) {
    final _$actionInfo = _$BuyStoreImplActionController.startAction(
        name: 'BuyStoreImpl.setPlayer');
    try {
      return super.setPlayer(value);
    } finally {
      _$BuyStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPlayerToVirtualTeam(BuyModel player) {
    final _$actionInfo = _$BuyStoreImplActionController.startAction(
        name: 'BuyStoreImpl.addPlayerToVirtualTeam');
    try {
      return super.addPlayerToVirtualTeam(player);
    } finally {
      _$BuyStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
teamList: ${teamList},
goleiro: ${goleiro},
zagueiro: ${zagueiro},
lateral: ${lateral},
meia: ${meia},
volante: ${volante},
atacante: ${atacante},
isGolAdd: ${isGolAdd},
isZagAdd: ${isZagAdd},
isButtonValid: ${isButtonValid}
    ''';
  }
}
