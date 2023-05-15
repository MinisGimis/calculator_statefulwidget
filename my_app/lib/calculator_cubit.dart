import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState(displayNum: 0.0, operationSymbol: "", n1: 0.0, clearAnswer: false));

  void addDigit(int newDigit) {
    if (state.clearAnswer) {
      double temp = state.displayNum;
      emit(CalculatorState(displayNum: 0.0, operationSymbol: state.operationSymbol, n1: temp, clearAnswer: false));
    }
    if (state.displayNum < 1000000000) {
      double newDisplayNum = (state.displayNum * 10) + newDigit;
      emit(CalculatorState(displayNum: newDisplayNum, operationSymbol: state.operationSymbol, n1: state.n1, clearAnswer: state.clearAnswer));
    }
  }

  void setOperation(String newOperation) {
    if (!state.clearAnswer && state.operationSymbol != "") {
      calculateResult();
    }
    emit(CalculatorState(displayNum: state.displayNum, operationSymbol: newOperation, n1: state.n1, clearAnswer: true));
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

    emit(CalculatorState(displayNum: result, operationSymbol: state.operationSymbol, n1: second, clearAnswer: true));
  }

  void reset() {
    emit(CalculatorState(displayNum: 0.0, operationSymbol: "", n1: 0.0, clearAnswer: false));
  }
}
