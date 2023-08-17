import 'patrimony_model.dart';

class ScoreModel {
  int? lastRound;
  List<PatrimonyModel>? patrimony;
  int? lastHighestScorer;

  ScoreModel({this.lastRound, this.patrimony, this.lastHighestScorer});

  ScoreModel.fromJson(Map<String, dynamic> json) {
    lastRound = json['last_round'];
    if (json['patrimony'] != null) {
      patrimony = <PatrimonyModel>[];
      json['patrimony'].forEach((v) {
        patrimony!.add(PatrimonyModel.fromJson(v));
      });
    }
    lastHighestScorer = json['last_highest_scorer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_round'] = lastRound;
    if (patrimony != null) {
      data['patrimony'] = patrimony!.map((v) => v.toJson()).toList();
    }
    data['last_highest_scorer'] = lastHighestScorer;
    return data;
  }
}
