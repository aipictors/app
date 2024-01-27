// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConfigState {
  bool get isTutorial => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  bool get themeMediumLayout => throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  Color? get themeColor => throw _privateConstructorUsedError;
  RemoteConfigFetchStatus get lastFetchStatus =>
      throw _privateConstructorUsedError;
  bool get eulaCheck => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfigStateCopyWith<ConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigStateCopyWith<$Res> {
  factory $ConfigStateCopyWith(
          ConfigState value, $Res Function(ConfigState) then) =
      _$ConfigStateCopyWithImpl<$Res, ConfigState>;
  @useResult
  $Res call(
      {bool isTutorial,
      String language,
      bool themeMediumLayout,
      ThemeMode themeMode,
      Color? themeColor,
      RemoteConfigFetchStatus lastFetchStatus,
      bool eulaCheck});
}

/// @nodoc
class _$ConfigStateCopyWithImpl<$Res, $Val extends ConfigState>
    implements $ConfigStateCopyWith<$Res> {
  _$ConfigStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTutorial = null,
    Object? language = null,
    Object? themeMediumLayout = null,
    Object? themeMode = null,
    Object? themeColor = freezed,
    Object? lastFetchStatus = null,
    Object? eulaCheck = null,
  }) {
    return _then(_value.copyWith(
      isTutorial: null == isTutorial
          ? _value.isTutorial
          : isTutorial // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      themeMediumLayout: null == themeMediumLayout
          ? _value.themeMediumLayout
          : themeMediumLayout // ignore: cast_nullable_to_non_nullable
              as bool,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      themeColor: freezed == themeColor
          ? _value.themeColor
          : themeColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      lastFetchStatus: null == lastFetchStatus
          ? _value.lastFetchStatus
          : lastFetchStatus // ignore: cast_nullable_to_non_nullable
              as RemoteConfigFetchStatus,
      eulaCheck: null == eulaCheck
          ? _value.eulaCheck
          : eulaCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigStateImplCopyWith<$Res>
    implements $ConfigStateCopyWith<$Res> {
  factory _$$ConfigStateImplCopyWith(
          _$ConfigStateImpl value, $Res Function(_$ConfigStateImpl) then) =
      __$$ConfigStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isTutorial,
      String language,
      bool themeMediumLayout,
      ThemeMode themeMode,
      Color? themeColor,
      RemoteConfigFetchStatus lastFetchStatus,
      bool eulaCheck});
}

/// @nodoc
class __$$ConfigStateImplCopyWithImpl<$Res>
    extends _$ConfigStateCopyWithImpl<$Res, _$ConfigStateImpl>
    implements _$$ConfigStateImplCopyWith<$Res> {
  __$$ConfigStateImplCopyWithImpl(
      _$ConfigStateImpl _value, $Res Function(_$ConfigStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTutorial = null,
    Object? language = null,
    Object? themeMediumLayout = null,
    Object? themeMode = null,
    Object? themeColor = freezed,
    Object? lastFetchStatus = null,
    Object? eulaCheck = null,
  }) {
    return _then(_$ConfigStateImpl(
      isTutorial: null == isTutorial
          ? _value.isTutorial
          : isTutorial // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      themeMediumLayout: null == themeMediumLayout
          ? _value.themeMediumLayout
          : themeMediumLayout // ignore: cast_nullable_to_non_nullable
              as bool,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      themeColor: freezed == themeColor
          ? _value.themeColor
          : themeColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      lastFetchStatus: null == lastFetchStatus
          ? _value.lastFetchStatus
          : lastFetchStatus // ignore: cast_nullable_to_non_nullable
              as RemoteConfigFetchStatus,
      eulaCheck: null == eulaCheck
          ? _value.eulaCheck
          : eulaCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ConfigStateImpl extends _ConfigState {
  const _$ConfigStateImpl(
      {required this.isTutorial,
      required this.language,
      required this.themeMediumLayout,
      required this.themeMode,
      required this.themeColor,
      required this.lastFetchStatus,
      required this.eulaCheck})
      : super._();

  @override
  final bool isTutorial;
  @override
  final String language;
  @override
  final bool themeMediumLayout;
  @override
  final ThemeMode themeMode;
  @override
  final Color? themeColor;
  @override
  final RemoteConfigFetchStatus lastFetchStatus;
  @override
  final bool eulaCheck;

  @override
  String toString() {
    return 'ConfigState(isTutorial: $isTutorial, language: $language, themeMediumLayout: $themeMediumLayout, themeMode: $themeMode, themeColor: $themeColor, lastFetchStatus: $lastFetchStatus, eulaCheck: $eulaCheck)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigStateImpl &&
            (identical(other.isTutorial, isTutorial) ||
                other.isTutorial == isTutorial) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.themeMediumLayout, themeMediumLayout) ||
                other.themeMediumLayout == themeMediumLayout) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.themeColor, themeColor) ||
                other.themeColor == themeColor) &&
            (identical(other.lastFetchStatus, lastFetchStatus) ||
                other.lastFetchStatus == lastFetchStatus) &&
            (identical(other.eulaCheck, eulaCheck) ||
                other.eulaCheck == eulaCheck));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isTutorial, language,
      themeMediumLayout, themeMode, themeColor, lastFetchStatus, eulaCheck);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigStateImplCopyWith<_$ConfigStateImpl> get copyWith =>
      __$$ConfigStateImplCopyWithImpl<_$ConfigStateImpl>(this, _$identity);
}

abstract class _ConfigState extends ConfigState {
  const factory _ConfigState(
      {required final bool isTutorial,
      required final String language,
      required final bool themeMediumLayout,
      required final ThemeMode themeMode,
      required final Color? themeColor,
      required final RemoteConfigFetchStatus lastFetchStatus,
      required final bool eulaCheck}) = _$ConfigStateImpl;
  const _ConfigState._() : super._();

  @override
  bool get isTutorial;
  @override
  String get language;
  @override
  bool get themeMediumLayout;
  @override
  ThemeMode get themeMode;
  @override
  Color? get themeColor;
  @override
  RemoteConfigFetchStatus get lastFetchStatus;
  @override
  bool get eulaCheck;
  @override
  @JsonKey(ignore: true)
  _$$ConfigStateImplCopyWith<_$ConfigStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
