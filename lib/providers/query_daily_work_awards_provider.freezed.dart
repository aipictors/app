// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'query_daily_work_awards_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QueryDailyWorkAwardsProps {
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QueryDailyWorkAwardsPropsCopyWith<QueryDailyWorkAwardsProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryDailyWorkAwardsPropsCopyWith<$Res> {
  factory $QueryDailyWorkAwardsPropsCopyWith(QueryDailyWorkAwardsProps value,
          $Res Function(QueryDailyWorkAwardsProps) then) =
      _$QueryDailyWorkAwardsPropsCopyWithImpl<$Res, QueryDailyWorkAwardsProps>;
  @useResult
  $Res call({int year, int month, int day});
}

/// @nodoc
class _$QueryDailyWorkAwardsPropsCopyWithImpl<$Res,
        $Val extends QueryDailyWorkAwardsProps>
    implements $QueryDailyWorkAwardsPropsCopyWith<$Res> {
  _$QueryDailyWorkAwardsPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? day = null,
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
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QueryDailyWorkAwardsPropsCopyWith<$Res>
    implements $QueryDailyWorkAwardsPropsCopyWith<$Res> {
  factory _$$_QueryDailyWorkAwardsPropsCopyWith(
          _$_QueryDailyWorkAwardsProps value,
          $Res Function(_$_QueryDailyWorkAwardsProps) then) =
      __$$_QueryDailyWorkAwardsPropsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int year, int month, int day});
}

/// @nodoc
class __$$_QueryDailyWorkAwardsPropsCopyWithImpl<$Res>
    extends _$QueryDailyWorkAwardsPropsCopyWithImpl<$Res,
        _$_QueryDailyWorkAwardsProps>
    implements _$$_QueryDailyWorkAwardsPropsCopyWith<$Res> {
  __$$_QueryDailyWorkAwardsPropsCopyWithImpl(
      _$_QueryDailyWorkAwardsProps _value,
      $Res Function(_$_QueryDailyWorkAwardsProps) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? day = null,
  }) {
    return _then(_$_QueryDailyWorkAwardsProps(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_QueryDailyWorkAwardsProps implements _QueryDailyWorkAwardsProps {
  const _$_QueryDailyWorkAwardsProps(
      {required this.year, required this.month, required this.day});

  @override
  final int year;
  @override
  final int month;
  @override
  final int day;

  @override
  String toString() {
    return 'QueryDailyWorkAwardsProps(year: $year, month: $month, day: $day)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryDailyWorkAwardsProps &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.day, day) || other.day == day));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year, month, day);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QueryDailyWorkAwardsPropsCopyWith<_$_QueryDailyWorkAwardsProps>
      get copyWith => __$$_QueryDailyWorkAwardsPropsCopyWithImpl<
          _$_QueryDailyWorkAwardsProps>(this, _$identity);
}

abstract class _QueryDailyWorkAwardsProps implements QueryDailyWorkAwardsProps {
  const factory _QueryDailyWorkAwardsProps(
      {required final int year,
      required final int month,
      required final int day}) = _$_QueryDailyWorkAwardsProps;

  @override
  int get year;
  @override
  int get month;
  @override
  int get day;
  @override
  @JsonKey(ignore: true)
  _$$_QueryDailyWorkAwardsPropsCopyWith<_$_QueryDailyWorkAwardsProps>
      get copyWith => throw _privateConstructorUsedError;
}
