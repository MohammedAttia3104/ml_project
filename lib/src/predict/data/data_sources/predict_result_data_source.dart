import 'package:dio/dio.dart';
import 'package:ml_project/core/error/exceptions.dart';
import 'package:ml_project/core/network/error_message_model.dart';
import 'package:ml_project/src/predict/data/models/predict_model.dart';
import 'package:ml_project/src/predict/data/models/result_model.dart';

abstract class BasePredictResultDataSource {
  Future<ResultModel> getPredictResult(PredictModel predictModel);
}

class PredictResultDataSource implements BasePredictResultDataSource {
  @override
  Future<ResultModel> getPredictResult(PredictModel predictModel) async {
    final response = await Dio().post(
      'http://10.0.2.2:5000/predict',
      data: predictModel.toJson(),
    );
    if (response.statusCode == 200) {
      return ResultModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
