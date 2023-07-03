// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_daily_theme_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QueryDailyThemeProps {
  String get themeId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QueryDailyThemePropsCopyWith<QueryDailyThemeProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryDailyThemePropsCopyWith<$Res> {
  factory $QueryDailyThemePropsCopyWith(QueryDailyThemeProps value,
          $Res Function(QueryDailyThemeProps) then) =
      _$QueryDailyThemePropsCopyWithImpl<$Res, QueryDailyThemeProps>;
  @useResult
  $Res call({String themeId});
}

/// @nodoc
class _$QueryDailyThemePropsCopyWithImpl<$Res,
        $Val extends QueryDailyThemeProps>
    implements $QueryDailyThemePropsCopyWith<$Res> {
  _$QueryDailyThemePropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeId = null,
  }) {
    return _then(_value.copyWith(
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QueryDailyThemePropsCopyWith<$Res>
    implements $QueryDailyThemePropsCopyWith<$Res> {
  factory _$$_QueryDailyThemePropsCopyWith(_$_QueryDailyThemeProps value,
          $Res Function(_$_QueryDailyThemeProps) then) =
      __$$_QueryDailyThemePropsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String themeId});
}

/// @nodoc
class __$$_QueryDailyThemePropsCopyWithImpl<$Res>
    extends _$QueryDailyThemePropsCopyWithImpl<$Res, _$_QueryDailyThemeProps>
    implements _$$_QueryDailyThemePropsCopyWith<$Res> {
  __$$_QueryDailyThemePropsCopyWithImpl(_$_QueryDailyThemeProps _value,
      $Res Function(_$_QueryDailyThemeProps) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeId = null,
  }) {
    return _then(_$_QueryDailyThemeProps(
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_QueryDailyThemeProps implements _QueryDailyThemeProps {
  const _$_QueryDailyThemeProps({required this.themeId});

  @override
  final String themeId;

  @override
  String toString() {
    return 'QueryDailyThemeProps(themeId: $themeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryDailyThemeProps &&
            (identical(other.themeId, themeId) || other.themeId == themeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QueryDailyThemePropsCopyWith<_$_QueryDailyThemeProps> get copyWith =>
      __$$_QueryDailyThemePropsCopyWithImpl<_$_QueryDailyThemeProps>(
          this, _$identity);
}

abstract class _QueryDailyThemeProps implements QueryDailyThemeProps {
  const factory _QueryDailyThemeProps({required final String themeId}) =
      _$_QueryDailyThemeProps;

  @override
  String get themeId;
  @override
  @JsonKey(ignore: true)
  _$$_QueryDailyThemePropsCopyWith<_$_QueryDailyThemeProps> get copyWith =>
      throw _privateConstructorUsedError;
}
