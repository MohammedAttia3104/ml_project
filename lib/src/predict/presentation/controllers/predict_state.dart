part of 'predict_cubit.dart';

@immutable
sealed class PredictState {}

final class PredictInitial extends PredictState {}

final class PredictLoading extends PredictState {}

final class PredictSuccess extends PredictState {
  final ResultModel resultModel;

  PredictSuccess(this.resultModel);
}

final class PredictError extends PredictState {
  final String message;

  PredictError(this.message);
}
