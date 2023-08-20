// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RankingController on RankingControllerImpl, Store {
  late final _$stateControllerAtom =
      Atom(name: 'RankingControllerImpl.stateController', context: context);

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

  late final _$rankingServicesAtom =
      Atom(name: 'RankingControllerImpl.rankingServices', context: context);

  @override
  RankingServices get rankingServices {
    _$rankingServicesAtom.reportRead();
    return super.rankingServices;
  }

  @override
  set rankingServices(RankingServices value) {
    _$rankingServicesAtom.reportWrite(value, super.rankingServices, () {
      super.rankingServices = value;
    });
  }

  late final _$rankingListAtom =
      Atom(name: 'RankingControllerImpl.rankingList', context: context);

  @override
  List<RankingModel> get rankingList {
    _$rankingListAtom.reportRead();
    return super.rankingList;
  }

  @override
  set rankingList(List<RankingModel> value) {
    _$rankingListAtom.reportWrite(value, super.rankingList, () {
      super.rankingList = value;
    });
  }

  late final _$checkRankingAsyncAction =
      AsyncAction('RankingControllerImpl.checkRanking', context: context);

  @override
  Future<List<RankingModel>> checkRanking(String edition) {
    return _$checkRankingAsyncAction.run(() => super.checkRanking(edition));
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
rankingServices: ${rankingServices},
rankingList: ${rankingList}
    ''';
  }
}
