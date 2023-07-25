// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championship_round_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChampionshipRoundController on ChampionshipRoundControllerImpl, Store {
  late final _$stateControllerAtom = Atom(
      name: 'ChampionshipRoundControllerImpl.stateController',
      context: context);

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
      Atom(name: 'ChampionshipRoundControllerImpl.token', context: context);

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

  late final _$roundAtom =
      Atom(name: 'ChampionshipRoundControllerImpl.round', context: context);

  @override
  ChampionshipRoundModel get round {
    _$roundAtom.reportRead();
    return super.round;
  }

  @override
  set round(ChampionshipRoundModel value) {
    _$roundAtom.reportWrite(value, super.round, () {
      super.round = value;
    });
  }

  late final _$championshipRoundServicesAtom = Atom(
      name: 'ChampionshipRoundControllerImpl.championshipRoundServices',
      context: context);

  @override
  ChampionshipRoundServices get championshipRoundServices {
    _$championshipRoundServicesAtom.reportRead();
    return super.championshipRoundServices;
  }

  @override
  set championshipRoundServices(ChampionshipRoundServices value) {
    _$championshipRoundServicesAtom
        .reportWrite(value, super.championshipRoundServices, () {
      super.championshipRoundServices = value;
    });
  }

  late final _$roundTodayAsyncAction = AsyncAction(
      'ChampionshipRoundControllerImpl.roundToday',
      context: context);

  @override
  Future<ChampionshipRoundModel> roundToday(String token) {
    return _$roundTodayAsyncAction.run(() => super.roundToday(token));
  }

  late final _$initRoundTodayAsyncAction = AsyncAction(
      'ChampionshipRoundControllerImpl.initRoundToday',
      context: context);

  @override
  Future<void> initRoundToday() {
    return _$initRoundTodayAsyncAction.run(() => super.initRoundToday());
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
token: ${token},
round: ${round},
championshipRoundServices: ${championshipRoundServices}
    ''';
  }
}
