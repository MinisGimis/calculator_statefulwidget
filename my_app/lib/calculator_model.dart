import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorModel extends ChangeNotifier {
  double displayNum;
  String operationSymbol;
  double n1;
  bool clearAnswer;
  bool showDecimal;

  CalculatorModel({Map<String, dynamic>? json})
      : displayNum = json?['displayNum'] ?? 0.0,
        operationSymbol = json?['operationSymbol'] ?? "",
        n1 = json?['n1'] ?? 0.0,
        clearAnswer = json?['clearAnswer'] ?? false,
        showDecimal = json?['showDecimal'] ?? false;

  Future<void> saveState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stateString = jsonEncode({
      'displayNum': displayNum,
      'operationSymbol': operationSymbol,
      'n1': n1,
      'clearAnswer': clearAnswer,
      'showDecimal': showDecimal,
    });
    prefs.setString('calculatorState', stateString);
  }

  void addDigit(int newDigit) {
    if (clearAnswer) {
      double temp = displayNum;
      displayNum = 0.0;
      n1 = temp;
      clearAnswer = false;
      showDecimal = false;
    }
    if (displayNum < 1000000000) {
      double newDisplayNum = (displayNum * 10) + newDigit;
      displayNum = newDisplayNum;
    }
    notifyListeners();
  }

  void setOperation(String newOperation) {
    if (!clearAnswer && operationSymbol != "") {
      calculateResult();
    }
    operationSymbol = newOperation;
    clearAnswer = true;
    notifyListeners();
  }

  void calculateResult() {
    double result = displayNum;
    double first = clearAnswer ? displayNum : n1;
    double second = clearAnswer ? n1 : displayNum;

    switch (operationSymbol) {
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

    bool displayDecimal = showDecimal;
    if (!(result - result.toInt() == 0.0)) {
      displayDecimal = true;
    }

    displayNum = result;
    n1 = second;
    clearAnswer = true;
    showDecimal = displayDecimal;
    notifyListeners();
    saveState();
  }

  void reset() {
    displayNum = 0.0;
    operationSymbol = "";
    n1 = 0.0;
    clearAnswer = false;
    showDecimal = false;
    notifyListeners();
    saveState();
  }
}
