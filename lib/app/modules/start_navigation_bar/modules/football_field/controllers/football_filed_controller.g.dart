// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'football_filed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FootballFieldController on FootballFieldControllerImpl, Store {
  late final _$stateControllerAtom = Atom(
      name: 'FootballFieldControllerImpl.stateController', context: context);

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

  late final _$isChangeAtom =
      Atom(name: 'FootballFieldControllerImpl.isChange', context: context);

  @override
  bool get isChange {
    _$isChangeAtom.reportRead();
    return super.isChange;
  }

  @override
  set isChange(bool value) {
    _$isChangeAtom.reportWrite(value, super.isChange, () {
      super.isChange = value;
    });
  }

  late final _$playerListAtom =
      Atom(name: 'FootballFieldControllerImpl.playerList', context: context);

  @override
  List<FootballFieldModel> get playerList {
    _$playerListAtom.reportRead();
    return super.playerList;
  }

  @override
  set playerList(List<FootballFieldModel> value) {
    _$playerListAtom.reportWrite(value, super.playerList, () {
      super.playerList = value;
    });
  }

  late final _$coachListAtom =
      Atom(name: 'FootballFieldControllerImpl.coachList', context: context);

  @override
  List<CoachModel> get coachList {
    _$coachListAtom.reportRead();
    return super.coachList;
  }

  @override
  set coachList(List<CoachModel> value) {
    _$coachListAtom.reportWrite(value, super.coachList, () {
      super.coachList = value;
    });
  }

  late final _$footballFieldServicesAtom = Atom(
      name: 'FootballFieldControllerImpl.footballFieldServices',
      context: context);

  @override
  FootballFieldServices get footballFieldServices {
    _$footballFieldServicesAtom.reportRead();
    return super.footballFieldServices;
  }

  @override
  set footballFieldServices(FootballFieldServices value) {
    _$footballFieldServicesAtom.reportWrite(value, super.footballFieldServices,
        () {
      super.footballFieldServices = value;
    });
  }

  late final _$roundAtom =
      Atom(name: 'FootballFieldControllerImpl.round', context: context);

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

  late final _$checkTeamScaleAsyncAction = AsyncAction(
      'FootballFieldControllerImpl.checkTeamScale',
      context: context);

  @override
  Future<List<FootballFieldModel>> checkTeamScale(String round, String team) {
    return _$checkTeamScaleAsyncAction
        .run(() => super.checkTeamScale(round, team));
  }

  late final _$checkCoachAsyncAction =
      AsyncAction('FootballFieldControllerImpl.checkCoach', context: context);

  @override
  Future<List<CoachModel>> checkCoach(String edition) {
    return _$checkCoachAsyncAction.run(() => super.checkCoach(edition));
  }

  late final _$initTeamScaleAsyncAction = AsyncAction(
      'FootballFieldControllerImpl.initTeamScale',
      context: context);

  @override
  Future<List<FootballFieldModel>> initTeamScale(
      int round, int team, int edition) {
    return _$initTeamScaleAsyncAction
        .run(() => super.initTeamScale(round, team, edition));
  }

  late final _$FootballFieldControllerImplActionController =
      ActionController(name: 'FootballFieldControllerImpl', context: context);

  @override
  void setIsChange() {
    final _$actionInfo = _$FootballFieldControllerImplActionController
        .startAction(name: 'FootballFieldControllerImpl.setIsChange');
    try {
      return super.setIsChange();
    } finally {
      _$FootballFieldControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCoachList(dynamic value) {
    final _$actionInfo = _$FootballFieldControllerImplActionController
        .startAction(name: 'FootballFieldControllerImpl.setCoachList');
    try {
      return super.setCoachList(value);
    } finally {
      _$FootballFieldControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRound(dynamic value) {
    final _$actionInfo = _$FootballFieldControllerImplActionController
        .startAction(name: 'FootballFieldControllerImpl.setRound');
    try {
      return super.setRound(value);
    } finally {
      _$FootballFieldControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
isChange: ${isChange},
playerList: ${playerList},
coachList: ${coachList},
footballFieldServices: ${footballFieldServices},
round: ${round}
    ''';
  }
}
