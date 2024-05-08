import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ml_project/src/predict/data/models/predict_model.dart';
import 'package:ml_project/src/predict/data/models/result_model.dart';
import 'package:ml_project/src/predict/domain/use_cases/get_predict_result_use_case.dart';

part 'predict_state.dart';

class PredictCubit extends Cubit<PredictState> {
  final GetPredictResultUseCase getPredictResultUseCase;

  PredictCubit(this.getPredictResultUseCase) : super(PredictInitial());

  void predict(PredictModel predictModel) async {
    emit(PredictLoading());
    final result = await getPredictResultUseCase(predictModel);
    result.fold(
      (l) {
        emit(PredictError(l.message));
      },
      (r) {
        emit(PredictSuccess(r));
      },
    );
  }
}
