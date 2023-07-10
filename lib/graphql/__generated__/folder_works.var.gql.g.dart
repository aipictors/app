// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFolderWorksVars> _$gFolderWorksVarsSerializer =
    new _$GFolderWorksVarsSerializer();

class _$GFolderWorksVarsSerializer
    implements StructuredSerializer<GFolderWorksVars> {
  @override
  final Iterable<Type> types = const [GFolderWorksVars, _$GFolderWorksVars];
  @override
  final String wireName = 'GFolderWorksVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFolderWorksVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'folderId',
      serializers.serialize(object.folderId,
          specifiedType: const FullType(String)),
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GFolderWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderWorksVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'folderId':
          result.folderId = serializers.deserialize(value,
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

class _$GFolderWorksVars extends GFolderWorksVars {
  @override
  final String folderId;
  @override
  final int offset;
  @override
  final int limit;

  factory _$GFolderWorksVars(
          [void Function(GFolderWorksVarsBuilder)? updates]) =>
      (new GFolderWorksVarsBuilder()..update(updates))._build();

  _$GFolderWorksVars._(
      {required this.folderId, required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        folderId, r'GFolderWorksVars', 'folderId');
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GFolderWorksVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GFolderWorksVars', 'limit');
  }

  @override
  GFolderWorksVars rebuild(void Function(GFolderWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderWorksVarsBuilder toBuilder() =>
      new GFolderWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderWorksVars &&
        folderId == other.folderId &&
        offset == other.offset &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, folderId.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderWorksVars')
          ..add('folderId', folderId)
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GFolderWorksVarsBuilder
    implements Builder<GFolderWorksVars, GFolderWorksVarsBuilder> {
  _$GFolderWorksVars? _$v;

  String? _folderId;
  String? get folderId => _$this._folderId;
  set folderId(String? folderId) => _$this._folderId = folderId;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GFolderWorksVarsBuilder();

  GFolderWorksVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _folderId = $v.folderId;
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderWorksVars;
  }

  @override
  void update(void Function(GFolderWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderWorksVars build() => _build();

  _$GFolderWorksVars _build() {
    final _$result = _$v ??
        new _$GFolderWorksVars._(
            folderId: BuiltValueNullFieldError.checkNotNull(
                folderId, r'GFolderWorksVars', 'folderId'),
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GFolderWorksVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GFolderWorksVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
