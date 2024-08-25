// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_albums.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerAlbumsVars> _$gViewerAlbumsVarsSerializer =
    new _$GViewerAlbumsVarsSerializer();

class _$GViewerAlbumsVarsSerializer
    implements StructuredSerializer<GViewerAlbumsVars> {
  @override
  final Iterable<Type> types = const [GViewerAlbumsVars, _$GViewerAlbumsVars];
  @override
  final String wireName = 'GViewerAlbumsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GViewerAlbumsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GViewerAlbumsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerAlbumsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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

class _$GViewerAlbumsVars extends GViewerAlbumsVars {
  @override
  final int offset;
  @override
  final int limit;

  factory _$GViewerAlbumsVars(
          [void Function(GViewerAlbumsVarsBuilder)? updates]) =>
      (new GViewerAlbumsVarsBuilder()..update(updates))._build();

  _$GViewerAlbumsVars._({required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GViewerAlbumsVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GViewerAlbumsVars', 'limit');
  }

  @override
  GViewerAlbumsVars rebuild(void Function(GViewerAlbumsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerAlbumsVarsBuilder toBuilder() =>
      new GViewerAlbumsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerAlbumsVars &&
        offset == other.offset &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerAlbumsVars')
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GViewerAlbumsVarsBuilder
    implements Builder<GViewerAlbumsVars, GViewerAlbumsVarsBuilder> {
  _$GViewerAlbumsVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GViewerAlbumsVarsBuilder();

  GViewerAlbumsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerAlbumsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerAlbumsVars;
  }

  @override
  void update(void Function(GViewerAlbumsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerAlbumsVars build() => _build();

  _$GViewerAlbumsVars _build() {
    final _$result = _$v ??
        new _$GViewerAlbumsVars._(
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GViewerAlbumsVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GViewerAlbumsVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
