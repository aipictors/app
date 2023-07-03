// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_search_works_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchWorksProps {
  String get search => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchWorksPropsCopyWith<SearchWorksProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchWorksPropsCopyWith<$Res> {
  factory $SearchWorksPropsCopyWith(
          SearchWorksProps value, $Res Function(SearchWorksProps) then) =
      _$SearchWorksPropsCopyWithImpl<$Res, SearchWorksProps>;
  @useResult
  $Res call({String search});
}

/// @nodoc
class _$SearchWorksPropsCopyWithImpl<$Res, $Val extends SearchWorksProps>
    implements $SearchWorksPropsCopyWith<$Res> {
  _$SearchWorksPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
  }) {
    return _then(_value.copyWith(
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchWorksPropsCopyWith<$Res>
    implements $SearchWorksPropsCopyWith<$Res> {
  factory _$$_SearchWorksPropsCopyWith(
          _$_SearchWorksProps value, $Res Function(_$_SearchWorksProps) then) =
      __$$_SearchWorksPropsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String search});
}

/// @nodoc
class __$$_SearchWorksPropsCopyWithImpl<$Res>
    extends _$SearchWorksPropsCopyWithImpl<$Res, _$_SearchWorksProps>
    implements _$$_SearchWorksPropsCopyWith<$Res> {
  __$$_SearchWorksPropsCopyWithImpl(
      _$_SearchWorksProps _value, $Res Function(_$_SearchWorksProps) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
  }) {
    return _then(_$_SearchWorksProps(
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchWorksProps implements _SearchWorksProps {
  const _$_SearchWorksProps({required this.search});

  @override
  final String search;

  @override
  String toString() {
    return 'SearchWorksProps(search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchWorksProps &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchWorksPropsCopyWith<_$_SearchWorksProps> get copyWith =>
      __$$_SearchWorksPropsCopyWithImpl<_$_SearchWorksProps>(this, _$identity);
}

abstract class _SearchWorksProps implements SearchWorksProps {
  const factory _SearchWorksProps({required final String search}) =
      _$_SearchWorksProps;

  @override
  String get search;
  @override
  @JsonKey(ignore: true)
  _$$_SearchWorksPropsCopyWith<_$_SearchWorksProps> get copyWith =>
      throw _privateConstructorUsedError;
}
