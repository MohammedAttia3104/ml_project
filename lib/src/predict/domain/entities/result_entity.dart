import 'package:equatable/equatable.dart  ';

class ResultEntity extends Equatable {
  final bool willExit;
  final double prob;

  const ResultEntity({
    required this.willExit,
    required this.prob,
  });

  @override
  List<Object?> get props => [
        willExit,
        prob,
      ];
}
