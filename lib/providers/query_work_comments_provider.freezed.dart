// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_work_comments_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QueryWorkCommentsProps {
  String get workId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QueryWorkCommentsPropsCopyWith<QueryWorkCommentsProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryWorkCommentsPropsCopyWith<$Res> {
  factory $QueryWorkCommentsPropsCopyWith(QueryWorkCommentsProps value,
          $Res Function(QueryWorkCommentsProps) then) =
      _$QueryWorkCommentsPropsCopyWithImpl<$Res, QueryWorkCommentsProps>;
  @useResult
  $Res call({String workId});
}

/// @nodoc
class _$QueryWorkCommentsPropsCopyWithImpl<$Res,
        $Val extends QueryWorkCommentsProps>
    implements $QueryWorkCommentsPropsCopyWith<$Res> {
  _$QueryWorkCommentsPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workId = null,
  }) {
    return _then(_value.copyWith(
      workId: null == workId
          ? _value.workId
          : workId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QueryWorkCommentsPropsCopyWith<$Res>
    implements $QueryWorkCommentsPropsCopyWith<$Res> {
  factory _$$_QueryWorkCommentsPropsCopyWith(_$_QueryWorkCommentsProps value,
          $Res Function(_$_QueryWorkCommentsProps) then) =
      __$$_QueryWorkCommentsPropsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String workId});
}

/// @nodoc
class __$$_QueryWorkCommentsPropsCopyWithImpl<$Res>
    extends _$QueryWorkCommentsPropsCopyWithImpl<$Res,
        _$_QueryWorkCommentsProps>
    implements _$$_QueryWorkCommentsPropsCopyWith<$Res> {
  __$$_QueryWorkCommentsPropsCopyWithImpl(_$_QueryWorkCommentsProps _value,
      $Res Function(_$_QueryWorkCommentsProps) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workId = null,
  }) {
    return _then(_$_QueryWorkCommentsProps(
      workId: null == workId
          ? _value.workId
          : workId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_QueryWorkCommentsProps implements _QueryWorkCommentsProps {
  const _$_QueryWorkCommentsProps({required this.workId});

  @override
  final String workId;

  @override
  String toString() {
    return 'QueryWorkCommentsProps(workId: $workId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryWorkCommentsProps &&
            (identical(other.workId, workId) || other.workId == workId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QueryWorkCommentsPropsCopyWith<_$_QueryWorkCommentsProps> get copyWith =>
      __$$_QueryWorkCommentsPropsCopyWithImpl<_$_QueryWorkCommentsProps>(
          this, _$identity);
}

abstract class _QueryWorkCommentsProps implements QueryWorkCommentsProps {
  const factory _QueryWorkCommentsProps({required final String workId}) =
      _$_QueryWorkCommentsProps;

  @override
  String get workId;
  @override
  @JsonKey(ignore: true)
  _$$_QueryWorkCommentsPropsCopyWith<_$_QueryWorkCommentsProps> get copyWith =>
      throw _privateConstructorUsedError;
}
