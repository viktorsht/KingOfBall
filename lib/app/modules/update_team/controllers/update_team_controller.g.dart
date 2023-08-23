// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_team_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateTeamController on UpdateTeamControllerBase, Store {
  late final _$stateControllerAtom =
      Atom(name: 'UpdateTeamControllerBase.stateController', context: context);

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

  late final _$updateTeamAsyncAction =
      AsyncAction('UpdateTeamControllerBase.updateTeam', context: context);

  @override
  Future<TeamGameModel> updateTeam(String team, TeamGameUpdate body) {
    return _$updateTeamAsyncAction.run(() => super.updateTeam(team, body));
  }

  @override
  String toString() {
    return '''
stateController: ${stateController}
    ''';
  }
}
