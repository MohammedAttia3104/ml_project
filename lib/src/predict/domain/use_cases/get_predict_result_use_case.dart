import 'package:dartz/dartz.dart';
import 'package:ml_project/core/error/failure.dart';
import 'package:ml_project/core/usecase/base_usecase.dart';
import 'package:ml_project/src/predict/data/models/predict_model.dart';
import 'package:ml_project/src/predict/data/models/result_model.dart';
import 'package:ml_project/src/predict/domain/repositories/base_predict_repository.dart';


class GetPredictResultUseCase extends BaseUseCase<ResultModel, PredictModel> {
  final BasePredictRepository repository;

  GetPredictResultUseCase(this.repository);

  @override
  Future<Either<Failure, ResultModel>> call(PredictModel parameters) async {
    return await repository.getPredictResult(parameters);
  }
}
