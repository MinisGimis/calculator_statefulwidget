class CalculatorState {
  final double displayNum;
  final String operationSymbol;
  final double n1;
  final bool clearAnswer;
  final bool showDecimal;

  CalculatorState({
    required this.displayNum,
    required this.operationSymbol,
    required this.n1,
    required this.clearAnswer,
    required this.showDecimal,
  });

  CalculatorState copyWith({
    double? displayNum,
    String? operationSymbol,
    double? n1,
    bool? clearAnswer,
    bool? showDecimal,
  }) {
    return CalculatorState(
      displayNum: displayNum ?? this.displayNum,
      operationSymbol: operationSymbol ?? this.operationSymbol,
      n1: n1 ?? this.n1,
      clearAnswer: clearAnswer ?? this.clearAnswer,
      showDecimal: showDecimal ?? this.showDecimal,
    );
  }
}
