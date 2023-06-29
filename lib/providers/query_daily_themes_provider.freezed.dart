// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'query_daily_themes_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QueryDailyThemesProps {
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QueryDailyThemesPropsCopyWith<QueryDailyThemesProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryDailyThemesPropsCopyWith<$Res> {
  factory $QueryDailyThemesPropsCopyWith(QueryDailyThemesProps value,
          $Res Function(QueryDailyThemesProps) then) =
      _$QueryDailyThemesPropsCopyWithImpl<$Res, QueryDailyThemesProps>;
  @useResult
  $Res call({int year, int month});
}

/// @nodoc
class _$QueryDailyThemesPropsCopyWithImpl<$Res,
        $Val extends QueryDailyThemesProps>
    implements $QueryDailyThemesPropsCopyWith<$Res> {
  _$QueryDailyThemesPropsCopyWithImpl(this._value, this._then);

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
abstract class _$$_QueryDailyThemesPropsCopyWith<$Res>
    implements $QueryDailyThemesPropsCopyWith<$Res> {
  factory _$$_QueryDailyThemesPropsCopyWith(_$_QueryDailyThemesProps value,
          $Res Function(_$_QueryDailyThemesProps) then) =
      __$$_QueryDailyThemesPropsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int year, int month});
}

/// @nodoc
class __$$_QueryDailyThemesPropsCopyWithImpl<$Res>
    extends _$QueryDailyThemesPropsCopyWithImpl<$Res, _$_QueryDailyThemesProps>
    implements _$$_QueryDailyThemesPropsCopyWith<$Res> {
  __$$_QueryDailyThemesPropsCopyWithImpl(_$_QueryDailyThemesProps _value,
      $Res Function(_$_QueryDailyThemesProps) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
  }) {
    return _then(_$_QueryDailyThemesProps(
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

class _$_QueryDailyThemesProps implements _QueryDailyThemesProps {
  const _$_QueryDailyThemesProps({required this.year, required this.month});

  @override
  final int year;
  @override
  final int month;

  @override
  String toString() {
    return 'QueryDailyThemesProps(year: $year, month: $month)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryDailyThemesProps &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year, month);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QueryDailyThemesPropsCopyWith<_$_QueryDailyThemesProps> get copyWith =>
      __$$_QueryDailyThemesPropsCopyWithImpl<_$_QueryDailyThemesProps>(
          this, _$identity);
}

abstract class _QueryDailyThemesProps implements QueryDailyThemesProps {
  const factory _QueryDailyThemesProps(
      {required final int year,
      required final int month}) = _$_QueryDailyThemesProps;

  @override
  int get year;
  @override
  int get month;
  @override
  @JsonKey(ignore: true)
  _$$_QueryDailyThemesPropsCopyWith<_$_QueryDailyThemesProps> get copyWith =>
      throw _privateConstructorUsedError;
}
