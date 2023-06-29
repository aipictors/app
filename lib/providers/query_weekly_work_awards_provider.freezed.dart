// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'query_weekly_work_awards_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QueryWeeklyWorkAwardsProps {
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get weekIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QueryWeeklyWorkAwardsPropsCopyWith<QueryWeeklyWorkAwardsProps>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryWeeklyWorkAwardsPropsCopyWith<$Res> {
  factory $QueryWeeklyWorkAwardsPropsCopyWith(QueryWeeklyWorkAwardsProps value,
          $Res Function(QueryWeeklyWorkAwardsProps) then) =
      _$QueryWeeklyWorkAwardsPropsCopyWithImpl<$Res,
          QueryWeeklyWorkAwardsProps>;
  @useResult
  $Res call({int year, int month, int weekIndex});
}

/// @nodoc
class _$QueryWeeklyWorkAwardsPropsCopyWithImpl<$Res,
        $Val extends QueryWeeklyWorkAwardsProps>
    implements $QueryWeeklyWorkAwardsPropsCopyWith<$Res> {
  _$QueryWeeklyWorkAwardsPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? weekIndex = null,
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
      weekIndex: null == weekIndex
          ? _value.weekIndex
          : weekIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QueryWeeklyWorkAwardsPropsCopyWith<$Res>
    implements $QueryWeeklyWorkAwardsPropsCopyWith<$Res> {
  factory _$$_QueryWeeklyWorkAwardsPropsCopyWith(
          _$_QueryWeeklyWorkAwardsProps value,
          $Res Function(_$_QueryWeeklyWorkAwardsProps) then) =
      __$$_QueryWeeklyWorkAwardsPropsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int year, int month, int weekIndex});
}

/// @nodoc
class __$$_QueryWeeklyWorkAwardsPropsCopyWithImpl<$Res>
    extends _$QueryWeeklyWorkAwardsPropsCopyWithImpl<$Res,
        _$_QueryWeeklyWorkAwardsProps>
    implements _$$_QueryWeeklyWorkAwardsPropsCopyWith<$Res> {
  __$$_QueryWeeklyWorkAwardsPropsCopyWithImpl(
      _$_QueryWeeklyWorkAwardsProps _value,
      $Res Function(_$_QueryWeeklyWorkAwardsProps) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? weekIndex = null,
  }) {
    return _then(_$_QueryWeeklyWorkAwardsProps(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      weekIndex: null == weekIndex
          ? _value.weekIndex
          : weekIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_QueryWeeklyWorkAwardsProps implements _QueryWeeklyWorkAwardsProps {
  const _$_QueryWeeklyWorkAwardsProps(
      {required this.year, required this.month, required this.weekIndex});

  @override
  final int year;
  @override
  final int month;
  @override
  final int weekIndex;

  @override
  String toString() {
    return 'QueryWeeklyWorkAwardsProps(year: $year, month: $month, weekIndex: $weekIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryWeeklyWorkAwardsProps &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.weekIndex, weekIndex) ||
                other.weekIndex == weekIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year, month, weekIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QueryWeeklyWorkAwardsPropsCopyWith<_$_QueryWeeklyWorkAwardsProps>
      get copyWith => __$$_QueryWeeklyWorkAwardsPropsCopyWithImpl<
          _$_QueryWeeklyWorkAwardsProps>(this, _$identity);
}

abstract class _QueryWeeklyWorkAwardsProps
    implements QueryWeeklyWorkAwardsProps {
  const factory _QueryWeeklyWorkAwardsProps(
      {required final int year,
      required final int month,
      required final int weekIndex}) = _$_QueryWeeklyWorkAwardsProps;

  @override
  int get year;
  @override
  int get month;
  @override
  int get weekIndex;
  @override
  @JsonKey(ignore: true)
  _$$_QueryWeeklyWorkAwardsPropsCopyWith<_$_QueryWeeklyWorkAwardsProps>
      get copyWith => throw _privateConstructorUsedError;
}
