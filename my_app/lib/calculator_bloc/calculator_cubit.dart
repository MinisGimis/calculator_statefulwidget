import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(const CalculatorState(displayNum: 0.0, operationSymbol: "", n1: 0.0, clearAnswer: false, showDecimal: false));

  void addDigit(int newDigit) {
    if (state.clearAnswer) {
      double temp = state.displayNum;
      emit(state.copyWith(displayNum: 0.0, n1: temp, clearAnswer: false, showDecimal: false));
    }
    if (state.displayNum < 1000000000) {
      double newDisplayNum = (state.displayNum * 10) + newDigit;
      emit(state.copyWith(displayNum: newDisplayNum));
    }
  }

  void setOperation(String newOperation) {
    if (!state.clearAnswer && state.operationSymbol != "") {
      calculateResult();
    }
    emit(state.copyWith(operationSymbol: newOperation, clearAnswer: true));
  }

  void calculateResult() {
    double result = state.displayNum;
    double first = state.clearAnswer ? state.displayNum : state.n1;
    double second = state.clearAnswer ? state.n1 : state.displayNum;

    switch (state.operationSymbol) {

      case "x":
        result = first * second;
        break;

      case "÷":
        result = first / second;
        break;

      case "+":
        result = first + second;
        break;

      case "-":
        result = first - second;
        break;

      default:
        break;
    }

    bool displayDecimal = state.showDecimal;
    if (!(result - result.toInt() == 0.0)) {
      displayDecimal = true;
    }

    emit(state.copyWith(displayNum: result, n1: second, clearAnswer: true, showDecimal: displayDecimal));
  }

  void reset() {
    emit(const CalculatorState(displayNum: 0.0, operationSymbol: "", n1: 0.0, clearAnswer: false, showDecimal: false));
  }
}
