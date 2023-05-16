import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculator_state.freezed.dart';
part 'calculator_state.g.dart';

@freezed
class CalculatorState with _$CalculatorState {
  const factory CalculatorState({
    required double displayNum,
    required String operationSymbol,
    required double n1,
    required bool clearAnswer,
    required bool showDecimal,
  }) = _CalculatorState;

  factory CalculatorState.fromJson(Map<String, dynamic> json) => _$CalculatorStateFromJson(json);
}
