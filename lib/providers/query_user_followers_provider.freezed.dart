// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'query_user_followers_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QueryUserFollowersProps {
  String get userId => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QueryUserFollowersPropsCopyWith<QueryUserFollowersProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryUserFollowersPropsCopyWith<$Res> {
  factory $QueryUserFollowersPropsCopyWith(QueryUserFollowersProps value,
          $Res Function(QueryUserFollowersProps) then) =
      _$QueryUserFollowersPropsCopyWithImpl<$Res, QueryUserFollowersProps>;
  @useResult
  $Res call({String userId, int page});
}

/// @nodoc
class _$QueryUserFollowersPropsCopyWithImpl<$Res,
        $Val extends QueryUserFollowersProps>
    implements $QueryUserFollowersPropsCopyWith<$Res> {
  _$QueryUserFollowersPropsCopyWithImpl(this._value, this._then);

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
abstract class _$$_QueryUserFollowersPropsCopyWith<$Res>
    implements $QueryUserFollowersPropsCopyWith<$Res> {
  factory _$$_QueryUserFollowersPropsCopyWith(_$_QueryUserFollowersProps value,
          $Res Function(_$_QueryUserFollowersProps) then) =
      __$$_QueryUserFollowersPropsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, int page});
}

/// @nodoc
class __$$_QueryUserFollowersPropsCopyWithImpl<$Res>
    extends _$QueryUserFollowersPropsCopyWithImpl<$Res,
        _$_QueryUserFollowersProps>
    implements _$$_QueryUserFollowersPropsCopyWith<$Res> {
  __$$_QueryUserFollowersPropsCopyWithImpl(_$_QueryUserFollowersProps _value,
      $Res Function(_$_QueryUserFollowersProps) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? page = null,
  }) {
    return _then(_$_QueryUserFollowersProps(
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

class _$_QueryUserFollowersProps implements _QueryUserFollowersProps {
  const _$_QueryUserFollowersProps({required this.userId, required this.page});

  @override
  final String userId;
  @override
  final int page;

  @override
  String toString() {
    return 'QueryUserFollowersProps(userId: $userId, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryUserFollowersProps &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QueryUserFollowersPropsCopyWith<_$_QueryUserFollowersProps>
      get copyWith =>
          __$$_QueryUserFollowersPropsCopyWithImpl<_$_QueryUserFollowersProps>(
              this, _$identity);
}

abstract class _QueryUserFollowersProps implements QueryUserFollowersProps {
  const factory _QueryUserFollowersProps(
      {required final String userId,
      required final int page}) = _$_QueryUserFollowersProps;

  @override
  String get userId;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_QueryUserFollowersPropsCopyWith<_$_QueryUserFollowersProps>
      get copyWith => throw _privateConstructorUsedError;
}
