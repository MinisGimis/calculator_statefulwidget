// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalculatorState _$$_CalculatorStateFromJson(Map<String, dynamic> json) =>
    _$_CalculatorState(
      displayNum: (json['displayNum'] as num).toDouble(),
      operationSymbol: json['operationSymbol'] as String,
      n1: (json['n1'] as num).toDouble(),
      clearAnswer: json['clearAnswer'] as bool,
      showDecimal: json['showDecimal'] as bool,
    );

Map<String, dynamic> _$$_CalculatorStateToJson(_$_CalculatorState instance) =>
    <String, dynamic>{
      'displayNum': instance.displayNum,
      'operationSymbol': instance.operationSymbol,
      'n1': instance.n1,
      'clearAnswer': instance.clearAnswer,
      'showDecimal': instance.showDecimal,
    };
