// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_albums.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserAlbumsVars> _$gUserAlbumsVarsSerializer =
    new _$GUserAlbumsVarsSerializer();

class _$GUserAlbumsVarsSerializer
    implements StructuredSerializer<GUserAlbumsVars> {
  @override
  final Iterable<Type> types = const [GUserAlbumsVars, _$GUserAlbumsVars];
  @override
  final String wireName = 'GUserAlbumsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserAlbumsVars object,
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
  GUserAlbumsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserAlbumsVarsBuilder();

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

class _$GUserAlbumsVars extends GUserAlbumsVars {
  @override
  final String user_id;
  @override
  final int offset;
  @override
  final int limit;

  factory _$GUserAlbumsVars([void Function(GUserAlbumsVarsBuilder)? updates]) =>
      (new GUserAlbumsVarsBuilder()..update(updates))._build();

  _$GUserAlbumsVars._(
      {required this.user_id, required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        user_id, r'GUserAlbumsVars', 'user_id');
    BuiltValueNullFieldError.checkNotNull(offset, r'GUserAlbumsVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GUserAlbumsVars', 'limit');
  }

  @override
  GUserAlbumsVars rebuild(void Function(GUserAlbumsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserAlbumsVarsBuilder toBuilder() =>
      new GUserAlbumsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserAlbumsVars &&
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
    return (newBuiltValueToStringHelper(r'GUserAlbumsVars')
          ..add('user_id', user_id)
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GUserAlbumsVarsBuilder
    implements Builder<GUserAlbumsVars, GUserAlbumsVarsBuilder> {
  _$GUserAlbumsVars? _$v;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GUserAlbumsVarsBuilder();

  GUserAlbumsVarsBuilder get _$this {
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
  void replace(GUserAlbumsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserAlbumsVars;
  }

  @override
  void update(void Function(GUserAlbumsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserAlbumsVars build() => _build();

  _$GUserAlbumsVars _build() {
    final _$result = _$v ??
        new _$GUserAlbumsVars._(
            user_id: BuiltValueNullFieldError.checkNotNull(
                user_id, r'GUserAlbumsVars', 'user_id'),
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GUserAlbumsVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GUserAlbumsVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
