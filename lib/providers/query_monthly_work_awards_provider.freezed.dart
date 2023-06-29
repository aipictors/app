// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'query_monthly_work_awards_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QueryMonthlyWorkAwardsProps {
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QueryMonthlyWorkAwardsPropsCopyWith<QueryMonthlyWorkAwardsProps>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryMonthlyWorkAwardsPropsCopyWith<$Res> {
  factory $QueryMonthlyWorkAwardsPropsCopyWith(
          QueryMonthlyWorkAwardsProps value,
          $Res Function(QueryMonthlyWorkAwardsProps) then) =
      _$QueryMonthlyWorkAwardsPropsCopyWithImpl<$Res,
          QueryMonthlyWorkAwardsProps>;
  @useResult
  $Res call({int year, int month});
}

/// @nodoc
class _$QueryMonthlyWorkAwardsPropsCopyWithImpl<$Res,
        $Val extends QueryMonthlyWorkAwardsProps>
    implements $QueryMonthlyWorkAwardsPropsCopyWith<$Res> {
  _$QueryMonthlyWorkAwardsPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QueryMonthlyWorkAwardsPropsCopyWith<$Res>
    implements $QueryMonthlyWorkAwardsPropsCopyWith<$Res> {
  factory _$$_QueryMonthlyWorkAwardsPropsCopyWith(
          _$_QueryMonthlyWorkAwardsProps value,
          $Res Function(_$_QueryMonthlyWorkAwardsProps) then) =
      __$$_QueryMonthlyWorkAwardsPropsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int year, int month});
}

/// @nodoc
class __$$_QueryMonthlyWorkAwardsPropsCopyWithImpl<$Res>
    extends _$QueryMonthlyWorkAwardsPropsCopyWithImpl<$Res,
        _$_QueryMonthlyWorkAwardsProps>
    implements _$$_QueryMonthlyWorkAwardsPropsCopyWith<$Res> {
  __$$_QueryMonthlyWorkAwardsPropsCopyWithImpl(
      _$_QueryMonthlyWorkAwardsProps _value,
      $Res Function(_$_QueryMonthlyWorkAwardsProps) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
  }) {
    return _then(_$_QueryMonthlyWorkAwardsProps(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_QueryMonthlyWorkAwardsProps implements _QueryMonthlyWorkAwardsProps {
  const _$_QueryMonthlyWorkAwardsProps(
      {required this.year, required this.month});

  @override
  final int year;
  @override
  final int month;

  @override
  String toString() {
    return 'QueryMonthlyWorkAwardsProps(year: $year, month: $month)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryMonthlyWorkAwardsProps &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year, month);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QueryMonthlyWorkAwardsPropsCopyWith<_$_QueryMonthlyWorkAwardsProps>
      get copyWith => __$$_QueryMonthlyWorkAwardsPropsCopyWithImpl<
          _$_QueryMonthlyWorkAwardsProps>(this, _$identity);
}

abstract class _QueryMonthlyWorkAwardsProps
    implements QueryMonthlyWorkAwardsProps {
  const factory _QueryMonthlyWorkAwardsProps(
      {required final int year,
      required final int month}) = _$_QueryMonthlyWorkAwardsProps;

  @override
  int get year;
  @override
  int get month;
  @override
  @JsonKey(ignore: true)
  _$$_QueryMonthlyWorkAwardsPropsCopyWith<_$_QueryMonthlyWorkAwardsProps>
      get copyWith => throw _privateConstructorUsedError;
}
