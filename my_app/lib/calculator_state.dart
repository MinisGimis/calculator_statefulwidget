class CalculatorState {
  final double displayNum;
  final String operationSymbol;
  final double n1;
  final bool clearAnswer;

  CalculatorState({
    required this.displayNum,
    required this.operationSymbol,
    required this.n1,
    required this.clearAnswer,
  });

  CalculatorState copyWith({
    double? displayNum,
    String? operationSymbol,
    double? n1,
    bool? clearAnswer,
  }) {
    return CalculatorState(
      displayNum: displayNum ?? this.displayNum,
      operationSymbol: operationSymbol ?? this.operationSymbol,
      n1: n1 ?? this.n1,
      clearAnswer: clearAnswer ?? this.clearAnswer,
    );
  }
}
