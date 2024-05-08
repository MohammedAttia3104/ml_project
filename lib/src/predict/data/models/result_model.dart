import 'package:ml_project/src/predict/domain/entities/result_entity.dart';

class ResultModel extends ResultEntity {
  const ResultModel({required super.willExit, required super.prob});

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      willExit: json['Will exit'],
      prob: json['prob'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Will exit': willExit,
      'prob': prob,
    };
  }
}
