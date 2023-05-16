import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'calculator_state.dart';

Future<void> saveState(CalculatorState state) async {
  final prefs = await SharedPreferences.getInstance();
  final stateString = json.encode(state.toJson());
  await prefs.setString('calculatorState', stateString);
}

Future<CalculatorState> loadState() async {
  final prefs = await SharedPreferences.getInstance();
  final stateString = prefs.getString('calculatorState');
  if (stateString != null) {
    final stateJson = json.decode(stateString) as Map<String, dynamic>;
    return CalculatorState.fromJson(stateJson);
  } 
  else {
    return const CalculatorState(displayNum: 0.0, operationSymbol: "", n1: 0.0, clearAnswer: false, showDecimal: false);
  }
}

