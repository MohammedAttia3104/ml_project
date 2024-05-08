import 'package:dartz/dartz.dart';
import 'package:ml_project/core/error/failure.dart';
import 'package:ml_project/src/predict/data/models/predict_model.dart';
import 'package:ml_project/src/predict/data/models/result_model.dart';

abstract class BasePredictRepository {
  Future<Either<Failure, ResultModel>> getPredictResult(PredictModel predictModel);
}