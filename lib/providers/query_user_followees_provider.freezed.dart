// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_user_followees_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QueryUserFolloweesProps {
  String get userId => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QueryUserFolloweesPropsCopyWith<QueryUserFolloweesProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryUserFolloweesPropsCopyWith<$Res> {
  factory $QueryUserFolloweesPropsCopyWith(QueryUserFolloweesProps value,
          $Res Function(QueryUserFolloweesProps) then) =
      _$QueryUserFolloweesPropsCopyWithImpl<$Res, QueryUserFolloweesProps>;
  @useResult
  $Res call({String userId, int page});
}

/// @nodoc
class _$QueryUserFolloweesPropsCopyWithImpl<$Res,
        $Val extends QueryUserFolloweesProps>
    implements $QueryUserFolloweesPropsCopyWith<$Res> {
  _$QueryUserFolloweesPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QueryUserFolloweesPropsCopyWith<$Res>
    implements $QueryUserFolloweesPropsCopyWith<$Res> {
  factory _$$_QueryUserFolloweesPropsCopyWith(_$_QueryUserFolloweesProps value,
          $Res Function(_$_QueryUserFolloweesProps) then) =
      __$$_QueryUserFolloweesPropsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, int page});
}

/// @nodoc
class __$$_QueryUserFolloweesPropsCopyWithImpl<$Res>
    extends _$QueryUserFolloweesPropsCopyWithImpl<$Res,
        _$_QueryUserFolloweesProps>
    implements _$$_QueryUserFolloweesPropsCopyWith<$Res> {
  __$$_QueryUserFolloweesPropsCopyWithImpl(_$_QueryUserFolloweesProps _value,
      $Res Function(_$_QueryUserFolloweesProps) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? page = null,
  }) {
    return _then(_$_QueryUserFolloweesProps(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_QueryUserFolloweesProps implements _QueryUserFolloweesProps {
  const _$_QueryUserFolloweesProps({required this.userId, required this.page});

  @override
  final String userId;
  @override
  final int page;

  @override
  String toString() {
    return 'QueryUserFolloweesProps(userId: $userId, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryUserFolloweesProps &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QueryUserFolloweesPropsCopyWith<_$_QueryUserFolloweesProps>
      get copyWith =>
          __$$_QueryUserFolloweesPropsCopyWithImpl<_$_QueryUserFolloweesProps>(
              this, _$identity);
}

abstract class _QueryUserFolloweesProps implements QueryUserFolloweesProps {
  const factory _QueryUserFolloweesProps(
      {required final String userId,
      required final int page}) = _$_QueryUserFolloweesProps;

  @override
  String get userId;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_QueryUserFolloweesPropsCopyWith<_$_QueryUserFolloweesProps>
      get copyWith => throw _privateConstructorUsedError;
}
