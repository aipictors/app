// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SurveyState {
  SurveySex? get sex => throw _privateConstructorUsedError;
  SurveyTouchPoint? get touchPoint => throw _privateConstructorUsedError;

  /// Create a copy of SurveyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of SurveyState
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$SurveyStateImplCopyWith<$Res>
    implements $SurveyStateCopyWith<$Res> {
  factory _$$SurveyStateImplCopyWith(
          _$SurveyStateImpl value, $Res Function(_$SurveyStateImpl) then) =
      __$$SurveyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SurveySex? sex, SurveyTouchPoint? touchPoint});
}

/// @nodoc
class __$$SurveyStateImplCopyWithImpl<$Res>
    extends _$SurveyStateCopyWithImpl<$Res, _$SurveyStateImpl>
    implements _$$SurveyStateImplCopyWith<$Res> {
  __$$SurveyStateImplCopyWithImpl(
      _$SurveyStateImpl _value, $Res Function(_$SurveyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SurveyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sex = freezed,
    Object? touchPoint = freezed,
  }) {
    return _then(_$SurveyStateImpl(
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

class _$SurveyStateImpl extends _SurveyState {
  const _$SurveyStateImpl({required this.sex, required this.touchPoint})
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyStateImpl &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.touchPoint, touchPoint) ||
                other.touchPoint == touchPoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sex, touchPoint);

  /// Create a copy of SurveyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveyStateImplCopyWith<_$SurveyStateImpl> get copyWith =>
      __$$SurveyStateImplCopyWithImpl<_$SurveyStateImpl>(this, _$identity);
}

abstract class _SurveyState extends SurveyState {
  const factory _SurveyState(
      {required final SurveySex? sex,
      required final SurveyTouchPoint? touchPoint}) = _$SurveyStateImpl;
  const _SurveyState._() : super._();

  @override
  SurveySex? get sex;
  @override
  SurveyTouchPoint? get touchPoint;

  /// Create a copy of SurveyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SurveyStateImplCopyWith<_$SurveyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
