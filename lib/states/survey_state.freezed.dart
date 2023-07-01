// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'survey_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SurveyState {
  SurveySex? get sex => throw _privateConstructorUsedError;
  SurveyTouchPoint? get touchPoint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SurveyStateCopyWith<SurveyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyStateCopyWith<$Res> {
  factory $SurveyStateCopyWith(
          SurveyState value, $Res Function(SurveyState) then) =
      _$SurveyStateCopyWithImpl<$Res, SurveyState>;
  @useResult
  $Res call({SurveySex? sex, SurveyTouchPoint? touchPoint});
}

/// @nodoc
class _$SurveyStateCopyWithImpl<$Res, $Val extends SurveyState>
    implements $SurveyStateCopyWith<$Res> {
  _$SurveyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sex = freezed,
    Object? touchPoint = freezed,
  }) {
    return _then(_value.copyWith(
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as SurveySex?,
      touchPoint: freezed == touchPoint
          ? _value.touchPoint
          : touchPoint // ignore: cast_nullable_to_non_nullable
              as SurveyTouchPoint?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SurveyStateCopyWith<$Res>
    implements $SurveyStateCopyWith<$Res> {
  factory _$$_SurveyStateCopyWith(
          _$_SurveyState value, $Res Function(_$_SurveyState) then) =
      __$$_SurveyStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SurveySex? sex, SurveyTouchPoint? touchPoint});
}

/// @nodoc
class __$$_SurveyStateCopyWithImpl<$Res>
    extends _$SurveyStateCopyWithImpl<$Res, _$_SurveyState>
    implements _$$_SurveyStateCopyWith<$Res> {
  __$$_SurveyStateCopyWithImpl(
      _$_SurveyState _value, $Res Function(_$_SurveyState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sex = freezed,
    Object? touchPoint = freezed,
  }) {
    return _then(_$_SurveyState(
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as SurveySex?,
      touchPoint: freezed == touchPoint
          ? _value.touchPoint
          : touchPoint // ignore: cast_nullable_to_non_nullable
              as SurveyTouchPoint?,
    ));
  }
}

/// @nodoc

class _$_SurveyState extends _SurveyState {
  const _$_SurveyState({required this.sex, required this.touchPoint})
      : super._();

  @override
  final SurveySex? sex;
  @override
  final SurveyTouchPoint? touchPoint;

  @override
  String toString() {
    return 'SurveyState(sex: $sex, touchPoint: $touchPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyState &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.touchPoint, touchPoint) ||
                other.touchPoint == touchPoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sex, touchPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SurveyStateCopyWith<_$_SurveyState> get copyWith =>
      __$$_SurveyStateCopyWithImpl<_$_SurveyState>(this, _$identity);
}

abstract class _SurveyState extends SurveyState {
  const factory _SurveyState(
      {required final SurveySex? sex,
      required final SurveyTouchPoint? touchPoint}) = _$_SurveyState;
  const _SurveyState._() : super._();

  @override
  SurveySex? get sex;
  @override
  SurveyTouchPoint? get touchPoint;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyStateCopyWith<_$_SurveyState> get copyWith =>
      throw _privateConstructorUsedError;
}
