// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalculatorState {
  double get displayNum => throw _privateConstructorUsedError;
  String get operationSymbol => throw _privateConstructorUsedError;
  double get n1 => throw _privateConstructorUsedError;
  bool get clearAnswer => throw _privateConstructorUsedError;
  bool get showDecimal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalculatorStateCopyWith<CalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatorStateCopyWith<$Res> {
  factory $CalculatorStateCopyWith(
          CalculatorState value, $Res Function(CalculatorState) then) =
      _$CalculatorStateCopyWithImpl<$Res, CalculatorState>;
  @useResult
  $Res call(
      {double displayNum,
      String operationSymbol,
      double n1,
      bool clearAnswer,
      bool showDecimal});
}

/// @nodoc
class _$CalculatorStateCopyWithImpl<$Res, $Val extends CalculatorState>
    implements $CalculatorStateCopyWith<$Res> {
  _$CalculatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayNum = null,
    Object? operationSymbol = null,
    Object? n1 = null,
    Object? clearAnswer = null,
    Object? showDecimal = null,
  }) {
    return _then(_value.copyWith(
      displayNum: null == displayNum
          ? _value.displayNum
          : displayNum // ignore: cast_nullable_to_non_nullable
              as double,
      operationSymbol: null == operationSymbol
          ? _value.operationSymbol
          : operationSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      n1: null == n1
          ? _value.n1
          : n1 // ignore: cast_nullable_to_non_nullable
              as double,
      clearAnswer: null == clearAnswer
          ? _value.clearAnswer
          : clearAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      showDecimal: null == showDecimal
          ? _value.showDecimal
          : showDecimal // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalculatorStateCopyWith<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  factory _$$_CalculatorStateCopyWith(
          _$_CalculatorState value, $Res Function(_$_CalculatorState) then) =
      __$$_CalculatorStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double displayNum,
      String operationSymbol,
      double n1,
      bool clearAnswer,
      bool showDecimal});
}

/// @nodoc
class __$$_CalculatorStateCopyWithImpl<$Res>
    extends _$CalculatorStateCopyWithImpl<$Res, _$_CalculatorState>
    implements _$$_CalculatorStateCopyWith<$Res> {
  __$$_CalculatorStateCopyWithImpl(
      _$_CalculatorState _value, $Res Function(_$_CalculatorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayNum = null,
    Object? operationSymbol = null,
    Object? n1 = null,
    Object? clearAnswer = null,
    Object? showDecimal = null,
  }) {
    return _then(_$_CalculatorState(
      displayNum: null == displayNum
          ? _value.displayNum
          : displayNum // ignore: cast_nullable_to_non_nullable
              as double,
      operationSymbol: null == operationSymbol
          ? _value.operationSymbol
          : operationSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      n1: null == n1
          ? _value.n1
          : n1 // ignore: cast_nullable_to_non_nullable
              as double,
      clearAnswer: null == clearAnswer
          ? _value.clearAnswer
          : clearAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      showDecimal: null == showDecimal
          ? _value.showDecimal
          : showDecimal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CalculatorState implements _CalculatorState {
  const _$_CalculatorState(
      {required this.displayNum,
      required this.operationSymbol,
      required this.n1,
      required this.clearAnswer,
      required this.showDecimal});

  @override
  final double displayNum;
  @override
  final String operationSymbol;
  @override
  final double n1;
  @override
  final bool clearAnswer;
  @override
  final bool showDecimal;

  @override
  String toString() {
    return 'CalculatorState(displayNum: $displayNum, operationSymbol: $operationSymbol, n1: $n1, clearAnswer: $clearAnswer, showDecimal: $showDecimal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalculatorState &&
            (identical(other.displayNum, displayNum) ||
                other.displayNum == displayNum) &&
            (identical(other.operationSymbol, operationSymbol) ||
                other.operationSymbol == operationSymbol) &&
            (identical(other.n1, n1) || other.n1 == n1) &&
            (identical(other.clearAnswer, clearAnswer) ||
                other.clearAnswer == clearAnswer) &&
            (identical(other.showDecimal, showDecimal) ||
                other.showDecimal == showDecimal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, displayNum, operationSymbol, n1, clearAnswer, showDecimal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalculatorStateCopyWith<_$_CalculatorState> get copyWith =>
      __$$_CalculatorStateCopyWithImpl<_$_CalculatorState>(this, _$identity);
}

abstract class _CalculatorState implements CalculatorState {
  const factory _CalculatorState(
      {required final double displayNum,
      required final String operationSymbol,
      required final double n1,
      required final bool clearAnswer,
      required final bool showDecimal}) = _$_CalculatorState;

  @override
  double get displayNum;
  @override
  String get operationSymbol;
  @override
  double get n1;
  @override
  bool get clearAnswer;
  @override
  bool get showDecimal;
  @override
  @JsonKey(ignore: true)
  _$$_CalculatorStateCopyWith<_$_CalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}
