import 'package:dartz/dartz.dart';
import 'package:ml_project/core/error/exceptions.dart';
import 'package:ml_project/core/error/failure.dart';
import 'package:ml_project/src/predict/data/data_sources/predict_result_data_source.dart';
import 'package:ml_project/src/predict/data/models/predict_model.dart';
import 'package:ml_project/src/predict/data/models/result_model.dart';
import 'package:ml_project/src/predict/domain/entities/result_entity.dart';
import 'package:ml_project/src/predict/domain/repositories/base_predict_repository.dart';

class PredictRepository extends BasePredictRepository {
  final BasePredictResultDataSource basePredictResultDataSource;

  PredictRepository(this.basePredictResultDataSource);

  @override
  Future<Either<Failure, ResultModel>> getPredictResult(
      PredictModel predictModel) async {
    final result =
        await basePredictResultDataSource.getPredictResult(predictModel);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
