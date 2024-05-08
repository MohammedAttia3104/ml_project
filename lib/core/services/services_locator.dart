import 'package:get_it/get_it.dart';
import 'package:ml_project/src/predict/data/data_sources/predict_result_data_source.dart';
import 'package:ml_project/src/predict/data/repositories/predict_repository.dart';
import 'package:ml_project/src/predict/domain/repositories/base_predict_repository.dart';
import 'package:ml_project/src/predict/domain/use_cases/get_predict_result_use_case.dart';
import 'package:ml_project/src/predict/presentation/controllers/predict_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerFactory<PredictCubit>(() => PredictCubit(sl()));
    sl.registerLazySingleton(() => GetPredictResultUseCase(sl()));
    sl.registerLazySingleton<BasePredictRepository>(
        () => PredictRepository(sl()));
    sl.registerLazySingleton<BasePredictResultDataSource>(
        () => PredictResultDataSource());
  }
}
