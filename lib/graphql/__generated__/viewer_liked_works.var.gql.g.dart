// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_liked_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerLikedWorksVars> _$gViewerLikedWorksVarsSerializer =
    new _$GViewerLikedWorksVarsSerializer();

class _$GViewerLikedWorksVarsSerializer
    implements StructuredSerializer<GViewerLikedWorksVars> {
  @override
  final Iterable<Type> types = const [
    GViewerLikedWorksVars,
    _$GViewerLikedWorksVars
  ];
  @override
  final String wireName = 'GViewerLikedWorksVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerLikedWorksVars object,
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
  GViewerLikedWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerLikedWorksVarsBuilder();

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

class _$GViewerLikedWorksVars extends GViewerLikedWorksVars {
  @override
  final int offset;
  @override
  final int limit;

  factory _$GViewerLikedWorksVars(
          [void Function(GViewerLikedWorksVarsBuilder)? updates]) =>
      (new GViewerLikedWorksVarsBuilder()..update(updates))._build();

  _$GViewerLikedWorksVars._({required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GViewerLikedWorksVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(
        limit, r'GViewerLikedWorksVars', 'limit');
  }

  @override
  GViewerLikedWorksVars rebuild(
          void Function(GViewerLikedWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerLikedWorksVarsBuilder toBuilder() =>
      new GViewerLikedWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerLikedWorksVars &&
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
    return (newBuiltValueToStringHelper(r'GViewerLikedWorksVars')
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GViewerLikedWorksVarsBuilder
    implements Builder<GViewerLikedWorksVars, GViewerLikedWorksVarsBuilder> {
  _$GViewerLikedWorksVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GViewerLikedWorksVarsBuilder();

  GViewerLikedWorksVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerLikedWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerLikedWorksVars;
  }

  @override
  void update(void Function(GViewerLikedWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerLikedWorksVars build() => _build();

  _$GViewerLikedWorksVars _build() {
    final _$result = _$v ??
        new _$GViewerLikedWorksVars._(
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GViewerLikedWorksVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GViewerLikedWorksVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
