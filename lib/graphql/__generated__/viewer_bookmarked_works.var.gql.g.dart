// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_bookmarked_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerBookmarkedWorksVars> _$gViewerBookmarkedWorksVarsSerializer =
    new _$GViewerBookmarkedWorksVarsSerializer();

class _$GViewerBookmarkedWorksVarsSerializer
    implements StructuredSerializer<GViewerBookmarkedWorksVars> {
  @override
  final Iterable<Type> types = const [
    GViewerBookmarkedWorksVars,
    _$GViewerBookmarkedWorksVars
  ];
  @override
  final String wireName = 'GViewerBookmarkedWorksVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerBookmarkedWorksVars object,
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
  GViewerBookmarkedWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerBookmarkedWorksVarsBuilder();

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

class _$GViewerBookmarkedWorksVars extends GViewerBookmarkedWorksVars {
  @override
  final int offset;
  @override
  final int limit;

  factory _$GViewerBookmarkedWorksVars(
          [void Function(GViewerBookmarkedWorksVarsBuilder)? updates]) =>
      (new GViewerBookmarkedWorksVarsBuilder()..update(updates))._build();

  _$GViewerBookmarkedWorksVars._({required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GViewerBookmarkedWorksVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(
        limit, r'GViewerBookmarkedWorksVars', 'limit');
  }

  @override
  GViewerBookmarkedWorksVars rebuild(
          void Function(GViewerBookmarkedWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerBookmarkedWorksVarsBuilder toBuilder() =>
      new GViewerBookmarkedWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerBookmarkedWorksVars &&
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
    return (newBuiltValueToStringHelper(r'GViewerBookmarkedWorksVars')
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GViewerBookmarkedWorksVarsBuilder
    implements
        Builder<GViewerBookmarkedWorksVars, GViewerBookmarkedWorksVarsBuilder> {
  _$GViewerBookmarkedWorksVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GViewerBookmarkedWorksVarsBuilder();

  GViewerBookmarkedWorksVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerBookmarkedWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerBookmarkedWorksVars;
  }

  @override
  void update(void Function(GViewerBookmarkedWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerBookmarkedWorksVars build() => _build();

  _$GViewerBookmarkedWorksVars _build() {
    final _$result = _$v ??
        new _$GViewerBookmarkedWorksVars._(
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GViewerBookmarkedWorksVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GViewerBookmarkedWorksVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
