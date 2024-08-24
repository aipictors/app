// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_folders.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerFoldersVars> _$gViewerFoldersVarsSerializer =
    new _$GViewerFoldersVarsSerializer();

class _$GViewerFoldersVarsSerializer
    implements StructuredSerializer<GViewerFoldersVars> {
  @override
  final Iterable<Type> types = const [GViewerFoldersVars, _$GViewerFoldersVars];
  @override
  final String wireName = 'GViewerFoldersVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerFoldersVars object,
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
  GViewerFoldersVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerFoldersVarsBuilder();

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

class _$GViewerFoldersVars extends GViewerFoldersVars {
  @override
  final int offset;
  @override
  final int limit;

  factory _$GViewerFoldersVars(
          [void Function(GViewerFoldersVarsBuilder)? updates]) =>
      (new GViewerFoldersVarsBuilder()..update(updates))._build();

  _$GViewerFoldersVars._({required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GViewerFoldersVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(
        limit, r'GViewerFoldersVars', 'limit');
  }

  @override
  GViewerFoldersVars rebuild(
          void Function(GViewerFoldersVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFoldersVarsBuilder toBuilder() =>
      new GViewerFoldersVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFoldersVars &&
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
    return (newBuiltValueToStringHelper(r'GViewerFoldersVars')
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GViewerFoldersVarsBuilder
    implements Builder<GViewerFoldersVars, GViewerFoldersVarsBuilder> {
  _$GViewerFoldersVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GViewerFoldersVarsBuilder();

  GViewerFoldersVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerFoldersVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFoldersVars;
  }

  @override
  void update(void Function(GViewerFoldersVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFoldersVars build() => _build();

  _$GViewerFoldersVars _build() {
    final _$result = _$v ??
        new _$GViewerFoldersVars._(
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GViewerFoldersVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GViewerFoldersVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
