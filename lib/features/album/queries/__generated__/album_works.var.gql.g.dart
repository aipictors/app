// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAlbumWorksVars> _$gAlbumWorksVarsSerializer =
    new _$GAlbumWorksVarsSerializer();

class _$GAlbumWorksVarsSerializer
    implements StructuredSerializer<GAlbumWorksVars> {
  @override
  final Iterable<Type> types = const [GAlbumWorksVars, _$GAlbumWorksVars];
  @override
  final String wireName = 'GAlbumWorksVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAlbumWorksVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'albumId',
      serializers.serialize(object.albumId,
          specifiedType: const FullType(String)),
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GAlbumWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumWorksVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'albumId':
          result.albumId = serializers.deserialize(value,
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

class _$GAlbumWorksVars extends GAlbumWorksVars {
  @override
  final String albumId;
  @override
  final int offset;
  @override
  final int limit;

  factory _$GAlbumWorksVars([void Function(GAlbumWorksVarsBuilder)? updates]) =>
      (new GAlbumWorksVarsBuilder()..update(updates))._build();

  _$GAlbumWorksVars._(
      {required this.albumId, required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        albumId, r'GAlbumWorksVars', 'albumId');
    BuiltValueNullFieldError.checkNotNull(offset, r'GAlbumWorksVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GAlbumWorksVars', 'limit');
  }

  @override
  GAlbumWorksVars rebuild(void Function(GAlbumWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumWorksVarsBuilder toBuilder() =>
      new GAlbumWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumWorksVars &&
        albumId == other.albumId &&
        offset == other.offset &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, albumId.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumWorksVars')
          ..add('albumId', albumId)
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GAlbumWorksVarsBuilder
    implements Builder<GAlbumWorksVars, GAlbumWorksVarsBuilder> {
  _$GAlbumWorksVars? _$v;

  String? _albumId;
  String? get albumId => _$this._albumId;
  set albumId(String? albumId) => _$this._albumId = albumId;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GAlbumWorksVarsBuilder();

  GAlbumWorksVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _albumId = $v.albumId;
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlbumWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumWorksVars;
  }

  @override
  void update(void Function(GAlbumWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumWorksVars build() => _build();

  _$GAlbumWorksVars _build() {
    final _$result = _$v ??
        new _$GAlbumWorksVars._(
            albumId: BuiltValueNullFieldError.checkNotNull(
                albumId, r'GAlbumWorksVars', 'albumId'),
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GAlbumWorksVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GAlbumWorksVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
