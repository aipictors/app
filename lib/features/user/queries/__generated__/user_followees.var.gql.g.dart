// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_followees.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserFolloweesVars> _$gUserFolloweesVarsSerializer =
    new _$GUserFolloweesVarsSerializer();

class _$GUserFolloweesVarsSerializer
    implements StructuredSerializer<GUserFolloweesVars> {
  @override
  final Iterable<Type> types = const [GUserFolloweesVars, _$GUserFolloweesVars];
  @override
  final String wireName = 'GUserFolloweesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFolloweesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user_id',
      serializers.serialize(object.user_id,
          specifiedType: const FullType(String)),
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GUserFolloweesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFolloweesVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFolloweesVars extends GUserFolloweesVars {
  @override
  final String user_id;
  @override
  final int offset;
  @override
  final int limit;

  factory _$GUserFolloweesVars(
          [void Function(GUserFolloweesVarsBuilder)? updates]) =>
      (new GUserFolloweesVarsBuilder()..update(updates))._build();

  _$GUserFolloweesVars._(
      {required this.user_id, required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        user_id, r'GUserFolloweesVars', 'user_id');
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GUserFolloweesVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(
        limit, r'GUserFolloweesVars', 'limit');
  }

  @override
  GUserFolloweesVars rebuild(
          void Function(GUserFolloweesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFolloweesVarsBuilder toBuilder() =>
      new GUserFolloweesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFolloweesVars &&
        user_id == other.user_id &&
        offset == other.offset &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserFolloweesVars')
          ..add('user_id', user_id)
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GUserFolloweesVarsBuilder
    implements Builder<GUserFolloweesVars, GUserFolloweesVarsBuilder> {
  _$GUserFolloweesVars? _$v;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GUserFolloweesVarsBuilder();

  GUserFolloweesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user_id = $v.user_id;
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFolloweesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFolloweesVars;
  }

  @override
  void update(void Function(GUserFolloweesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFolloweesVars build() => _build();

  _$GUserFolloweesVars _build() {
    final _$result = _$v ??
        new _$GUserFolloweesVars._(
            user_id: BuiltValueNullFieldError.checkNotNull(
                user_id, r'GUserFolloweesVars', 'user_id'),
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GUserFolloweesVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GUserFolloweesVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
